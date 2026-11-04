--[[

    This script adds SponsorBlock support to ModernZ. Requires curl (included in Windows 10+ by default)
    
    Forked from https://github.com/zydezu/mpvconfig/blob/main/scripts/sponsorblock.lua

    Skips sponsored segments of YouTube videos using data from https://github.com/ajayyy/SponsorBlock
--]]

local ON_WINDOWS = package.config:sub(1,1) ~= "/"

local options = {
    server_address = "https://sponsor.ajay.app",

    -- curl 
    curl_path = "curl",
    request_timeout = 20,

    -- Categories to fetch
    categories = "sponsor,intro,outro,interaction,selfpromo,preview,music_offtopic,filler",

    -- Categories to skip automatically
    skip_categories = "",

    -- If true, sponsored segments will only be skipped once
    skip_once = true,

    -- Show a message when a segment is skipped
    show_skip_message = false,

    -- If true, UUIDs (the brackets) will be removed from chapter titles
    removeuuid = true,

    -- User ID used to submit sponsored segments, leave blank for random
    user_id = "",

    -- Name to display on the stats page https://sponsor.ajay.app/stats/ leave blank to keep current name
    display_name = "",

    -- Tell the server when a skip happens
    report_views = true,

    -- Auto upvote skipped sponsors
    auto_upvote = false,

    -- Minimum duration for sponsors (in seconds), segments under that threshold will be ignored
    min_duration = 1,

    -- Fade audio for smoother transitions
    audio_fade = false,

    -- Audio fade step, applied once every 100ms until cap is reached
    audio_fade_step = 10,

    -- Audio fade cap
    audio_fade_cap = 0,

    -- Fast forward through sponsors instead of skipping
    fast_forward = false,

    -- Playback speed modifier when fast forwarding, applied once every second until cap is reached
    fast_forward_increase = .2,

    -- Playback speed cap
    fast_forward_cap = 2,

    -- Length of the sha256 prefix (3-32) when querying server, 0 to disable
    sha256_length = 4,

    -- Pattern for video id in local files, ignored if blank
    -- Recommended value for base youtube-dl is "-([%w-_]+)%.[mw][kpe][v4b]m?$"
    local_pattern = "",

    -- Legacy option, use skip_categories instead
    skip = true
}

-- declarations
local function select_category(selected) end

require("mp.options").read_options(options, "sponsorblock")

local utils = require "mp.utils"
local function expand_path(path)
   return mp.command_native({"expand-path", path})
end

local uid_path = expand_path("~~state/sponsorblock.txt")
mp.msg.debug("uid_path: " .. uid_path)

local youtube_id = nil
local ranges = {}
local init = false
local segment = {a = 0, b = 0, progress = 0, first = true}
local file_generation = 0
local submission_pending = false
local last_skip = {uuid = "", dir = nil}
local speed_timer = nil
local fade_timer = nil
local fade_dir = nil
local volume_before = mp.get_property_number("volume")
local categories = {}
local all_categories = {"sponsor", "intro", "outro", "interaction", "selfpromo", "preview", "music_offtopic", "filler"}
local segment_cache = {}
local original_chapters = nil
local published_chapters = nil
local preview_segment = nil
local category_titles = {
    sponsor = "Sponsor", intro = "Intro", outro = "Outro",
    interaction = "Interaction", selfpromo = "Self promo", preview = "Preview",
    music_offtopic = "Music off topic", filler = "Filler",
}

for category in string.gmatch(options.skip_categories, "([^,]+)") do
    categories[category] = true
end

local function file_exists(name)
    local f = io.open(name,"r")
    if f ~= nil then io.close(f) return true else return false end
end

-- mpv's LuaJIT and Lua 5.2 builds provide bit operations.
local bit = bit32 or require "bit"
local function sha256(value)
    local unpack = table.unpack or unpack
    local band, bxor, bnot, rshift = bit.band, bit.bxor, bit.bnot, bit.rshift
    local rotate = bit.ror or bit.rrotate
    local k = {
        0x428a2f98,0x71374491,0xb5c0fbcf,0xe9b5dba5,0x3956c25b,0x59f111f1,0x923f82a4,0xab1c5ed5,
        0xd807aa98,0x12835b01,0x243185be,0x550c7dc3,0x72be5d74,0x80deb1fe,0x9bdc06a7,0xc19bf174,
        0xe49b69c1,0xefbe4786,0x0fc19dc6,0x240ca1cc,0x2de92c6f,0x4a7484aa,0x5cb0a9dc,0x76f988da,
        0x983e5152,0xa831c66d,0xb00327c8,0xbf597fc7,0xc6e00bf3,0xd5a79147,0x06ca6351,0x14292967,
        0x27b70a85,0x2e1b2138,0x4d2c6dfc,0x53380d13,0x650a7354,0x766a0abb,0x81c2c92e,0x92722c85,
        0xa2bfe8a1,0xa81a664b,0xc24b8b70,0xc76c51a3,0xd192e819,0xd6990624,0xf40e3585,0x106aa070,
        0x19a4c116,0x1e376c08,0x2748774c,0x34b0bcb5,0x391c0cb3,0x4ed8aa4a,0x5b9cca4f,0x682e6ff3,
        0x748f82ee,0x78a5636f,0x84c87814,0x8cc70208,0x90befffa,0xa4506ceb,0xbef9a3f7,0xc67178f2,
    }
    local h = {0x6a09e667,0xbb67ae85,0x3c6ef372,0xa54ff53a,0x510e527f,0x9b05688c,0x1f83d9ab,0x5be0cd19}
    local length = #value * 8
    local suffix = ""
    for shift = 7, 0, -1 do suffix = suffix .. string.char(math.floor(length / 256^shift) % 256) end
    value = value .. "\128" .. string.rep("\0", (55 - #value) % 64) .. suffix
    for offset = 1, #value, 64 do
        local w = {}
        for i = 0, 15 do
            local a,b,c,d = value:byte(offset + i*4, offset + i*4 + 3)
            w[i] = ((a*256 + b)*256 + c)*256 + d
        end
        for i = 16, 63 do
            local a,b = w[i-15], w[i-2]
            w[i] = (w[i-16] + bxor(rotate(a,7),rotate(a,18),rshift(a,3)) + w[i-7] +
                bxor(rotate(b,17),rotate(b,19),rshift(b,10))) % 2^32
        end
        local a,b,c,d,e,f,g,hv = unpack(h)
        for i = 0, 63 do
            local t1 = (hv + bxor(rotate(e,6),rotate(e,11),rotate(e,25)) +
                bxor(band(e,f),band(bnot(e),g)) + k[i+1] + w[i]) % 2^32
            local t2 = (bxor(rotate(a,2),rotate(a,13),rotate(a,22)) +
                bxor(band(a,b),band(a,c),band(b,c))) % 2^32
            hv,g,f,e,d,c,b,a = g,f,e,(d+t1)%2^32,c,b,a,(t1+t2)%2^32
        end
        for i,v in ipairs({a,b,c,d,e,f,g,hv}) do h[i] = (h[i] + v) % 2^32 end
    end
    local hex = {}
    for i,v in ipairs(h) do hex[i] = string.format("%08x", v) end
    return table.concat(hex)
end

local function url_encode(value)
    return (tostring(value):gsub("([^%w%-_%.~])", function(c) return string.format("%%%02X", c:byte()) end))
end

local function request(method, path, query, body, callback)
    local params = {}
    for key,value in pairs(query or {}) do params[#params+1] = url_encode(key) .. "=" .. url_encode(value) end
    table.sort(params)
    local url = options.server_address:gsub("/+$", "") .. "/api/" .. path
    if #params > 0 then url = url .. "?" .. table.concat(params, "&") end
    local args = {options.curl_path, "--disable", "--silent", "--show-error", "--globoff",
        "--connect-timeout", "5", "--max-time", tostring(math.max(1, options.request_timeout)),
        "--user-agent", "mpv_sponsorblock/1.0", "--write-out", "\n%{http_code}", "--request", method,
        "--url", url}
    if body then
        args[#args+1] = "--header"
        args[#args+1] = "Content-Type: application/json"
        args[#args+1] = "--data-binary"
        args[#args+1] = utils.format_json(body)
    end
    return mp.command_native_async({name = "subprocess", args = args, playback_only = false,
        capture_stdout = true, capture_stderr = true}, function(success, result)
        local text, status = ((result and result.stdout) or ""):match("^(.*)\n(%d%d%d)%s*$")
        status = tonumber(status) or 0
        if not success or not result or result.status ~= 0 then status = 0 end
        callback(status >= 200 and status < 300, text or "", status)
    end)
end

local function get_user_id()
    if options.user_id ~= "" then return options.user_id end
    local f = io.open(uid_path, "r")
    if f then
        local value = f:read("*a"):match("^%s*(.-)%s*$")
        f:close()
        if value ~= "" then options.user_id = value; return value end
    end
    local random_bytes
    if ON_WINDOWS then
        local result = mp.command_native({name = "subprocess", playback_only = false, capture_stdout = true,
            args = {"powershell.exe", "-NoProfile", "-NonInteractive", "-Command",
                "$bytes = New-Object byte[] 32; $rng = [System.Security.Cryptography.RandomNumberGenerator]::Create(); " ..
                "$rng.GetBytes($bytes); $rng.Dispose(); [BitConverter]::ToString($bytes).Replace('-', '').ToLowerInvariant()"}})
        if result and result.status == 0 then random_bytes = (result.stdout or ""):match("%x+") end
    else
        f = io.open("/dev/urandom", "rb")
        if f then
            local bytes = f:read(32)
            f:close()
            if bytes and #bytes == 32 then random_bytes = (bytes:gsub(".", function(c) return string.format("%02x", c:byte()) end)) end
        end
    end
    if not random_bytes or #random_bytes ~= 64 then
        mp.osd_message("[sponsorblock] could not create user ID; set user_id in sponsorblock.conf", 5)
        return nil
    end
    f = io.open(uid_path, "w")
    if not f then
        mp.osd_message("[sponsorblock] could not save user ID", 5)
        return nil
    end
    f:write(random_bytes)
    f:close()
    options.user_id = random_bytes
    return random_bytes
end

local function send_vote(uuid, dir, callback)
    local uid = get_user_id()
    if not uid then return end
    request("POST", "voteOnSponsorTime", {UUID = uuid, userID = uid, type = dir}, nil, callback)
end

local function same_chapters(a, b)
    if not a or not b or #a ~= #b then return false end
    for i, chapter in ipairs(a) do
        if chapter.time ~= b[i].time or (chapter.title or "") ~= (b[i].title or "") then
            return false
        end
    end
    return true
end

local function publish_segments()
    if not original_chapters then return end
    local duration = mp.get_property_number("duration")
    local edge_tolerance = math.max(0, mp.get_property_number("user-data/modernz/sponsorblock-edge-tolerance", 0))
    local segments = {}
    local function add_segment(value)
        local first = math.max(0, value.start_time)
        local last = duration and math.min(duration, value.end_time) or value.end_time
        if last > first then
            if duration and duration - last <= edge_tolerance then last = duration end
            segments[#segments + 1] = {
                start_time = first, end_time = last,
                category = value.category, title = value.title,
            }
        end
    end
    for _, value in pairs(segment_cache) do add_segment(value) end
    if preview_segment then add_segment(preview_segment) end
    table.sort(segments, function(a, b)
        if a.start_time ~= b.start_time then return a.start_time < b.start_time end
        if a.end_time ~= b.end_time then return a.end_time < b.end_time end
        return a.title < b.title
    end)
    mp.set_property_native("user-data/sponsorblock/segments", segments)

    local chapters = original_chapters
    if #segments > 0 then
        local boundaries = {0}
        local originals_at = {}
        for _, chapter in ipairs(original_chapters) do
            boundaries[#boundaries + 1] = chapter.time
            originals_at[chapter.time] = chapter
        end
        for _, value in ipairs(segments) do
            boundaries[#boundaries + 1] = value.start_time
            boundaries[#boundaries + 1] = value.end_time
        end
        table.sort(boundaries)
        chapters = {}
        local original_title = "Video"
        local previous_time = nil
        for _, time in ipairs(boundaries) do
            if time ~= previous_time and (not duration or time < duration) then
                previous_time = time
                local original = originals_at[time]
                if original then original_title = original.title or "" end
                local titles, seen = {}, {}
                for _, value in ipairs(segments) do
                    if value.start_time <= time and time < value.end_time and not seen[value.title] then
                        titles[#titles + 1] = value.title
                        seen[value.title] = true
                    end
                end
                local title = #titles > 0 and table.concat(titles, " / ") or original_title
                local previous = chapters[#chapters]
                if not previous or previous.title ~= title or (#titles == 0 and original) then
                    chapters[#chapters + 1] = {time = time, title = title}
                end
            end
        end
    end
    published_chapters = chapters
    if not same_chapters(chapters, mp.get_property_native("chapter-list", {})) then
        mp.set_property_native("chapter-list", chapters)
    end
end

local function process(t, new_ranges, new_segments)
    if type(t) ~= "table" or type(t.segment) ~= "table" or type(t.UUID) ~= "string" or type(t.category) ~= "string" then return end
    local uuid, category = t.UUID, t.category
    local start_time, end_time = t.segment[1], t.segment[2]
    if type(start_time) ~= "number" or type(end_time) ~= "number" or
        start_time < 0 or end_time <= start_time or end_time == math.huge then return end
    local title = category_titles[category] or category
    if not options.removeuuid then title = title .. " (" .. string.sub(uuid, 1, 6) .. ")" end
    new_segments[uuid] = {
        start_time = start_time, end_time = end_time, category = category, title = title,
    }
    if ranges[uuid] then
        new_ranges[uuid] = ranges[uuid]
        return
    end
    for o_uuid, o_t in pairs(ranges) do
        if (start_time >= o_t.start_time and start_time <= o_t.end_time) or (o_t.start_time >= start_time and o_t.start_time <= end_time) then
            new_ranges[o_uuid] = o_t
            return
        end
    end
    if categories[category] and end_time - start_time >= options.min_duration then
        new_ranges[uuid] = {
            start_time = start_time,
            end_time = end_time,
            category = category,
            skipped = false
        }
    end
end

local function getranges()
    local generation, video_id = file_generation, youtube_id
    local requested_categories = {}
    for category in options.categories:gmatch("[^,]+") do requested_categories[#requested_categories+1] = category end
    local query = {categories = utils.format_json(requested_categories)}
    local path = "skipSegments"
    local hashed = options.sha256_length >= 3 and options.sha256_length <= 32
    if hashed then path = path .. "/" .. sha256(video_id):sub(1, math.floor(options.sha256_length))
    else query.videoID = video_id end
    request("GET", path, query, nil, function(success, body, status)
        if generation ~= file_generation then return end
        if status == 404 then return end -- no segments for this video
        if not success then
            mp.osd_message("[sponsorblock] could not fetch segments " ..
                (status == 0 and "(check curl and your connection)" or "(HTTP " .. status .. ")"), 5)
            return
        end
        local data = utils.parse_json(body)
        if type(data) ~= "table" then
            mp.msg.warn("[sponsorblock] invalid segment response")
            return
        end
        if hashed then
            local entries = {}
            for _, video in ipairs(data) do
                if type(video) == "table" and video.videoID == video_id and type(video.segments) == "table" then
                    entries = video.segments
                    break
                end
            end
            data = entries
        end
        local new_ranges, new_segments = {}, {}
        for _, value in pairs(data) do process(value, new_ranges, new_segments) end
        ranges, segment_cache = new_ranges, new_segments
        publish_segments()
    end)
end

local function fast_forward()
    if options.fast_forward and options.fast_forward == true then
        speed_timer = nil
        mp.set_property("speed", 1)
    end
    local last_speed = mp.get_property_number("speed")
    local new_speed = math.min(last_speed + options.fast_forward_increase, options.fast_forward_cap)
    if new_speed <= last_speed then return end
    mp.set_property("speed", new_speed)
end

local function fade_audio(step)
    local last_volume = mp.get_property_number("volume")
    local new_volume = math.max(options.audio_fade_cap, math.min(last_volume + step, volume_before))
    if new_volume == last_volume then
        if step >= 0 then fade_dir = nil end
        if fade_timer ~= nil then fade_timer:kill() end
        fade_timer = nil
        return
    end
    mp.set_property("volume", new_volume)
end

local function skip_ads(name, pos)
    if pos == nil then return end
    local sponsor_ahead = false
    for uuid, t in pairs(ranges) do
        if (options.fast_forward == uuid or not options.skip_once or not t.skipped) and t.start_time <= pos and t.end_time > pos then
            if options.fast_forward == uuid then return end
            if options.fast_forward == false then
                if options.show_skip_message then mp.osd_message("[sponsorblock] " .. t.category .. " skipped") end
                mp.commandv("seek", tostring(t.end_time), "absolute+exact")
            else
                mp.osd_message("[sponsorblock] skipping " .. t.category)
            end
            t.skipped = true
            last_skip = {uuid = uuid, dir = nil}
            if options.report_views then request("POST", "viewedVideoSponsorTime", {UUID = uuid}, nil, function() end) end
            if options.auto_upvote then send_vote(uuid, "1", function() end) end
            if options.fast_forward ~= false then
                options.fast_forward = uuid
                if speed_timer ~= nil then speed_timer:kill() end
                speed_timer = mp.add_periodic_timer(1, fast_forward)
            end
            return
        elseif (not options.skip_once or not t.skipped) and t.start_time <= pos + 1 and t.end_time > pos + 1 then
            sponsor_ahead = true
        end
    end
    if options.audio_fade then
        if sponsor_ahead then
            if fade_dir ~= false then
                if fade_dir == nil then volume_before = mp.get_property_number("volume") end
                if fade_timer ~= nil then fade_timer:kill() end
                fade_dir = false
                fade_timer = mp.add_periodic_timer(.1, function() fade_audio(-options.audio_fade_step) end)
            end
        elseif fade_dir == false then
            fade_dir = true
            if fade_timer ~= nil then fade_timer:kill() end
            fade_timer = mp.add_periodic_timer(.1, function() fade_audio(options.audio_fade_step) end)
        end
    end
    if options.fast_forward and options.fast_forward ~= true then
        options.fast_forward = true
        speed_timer:kill()
        speed_timer = nil
        mp.set_property("speed", 1)
    end
end

local function vote(dir)
    if last_skip.uuid == "" then return mp.osd_message("[sponsorblock] no sponsors skipped, can't submit vote") end
    local updown = dir == "1" and "up" or "down"
    if last_skip.dir == dir then return mp.osd_message("[sponsorblock] " .. updown .. "vote already submitted") end
    local skipped, generation = last_skip, file_generation
    send_vote(skipped.uuid, dir, function(success)
        if generation ~= file_generation then return end
        if success then skipped.dir = dir end
        mp.osd_message("[sponsorblock] " .. updown .. "vote " .. (success and "submitted" or "failed"))
    end)
end

local function submit_segment(category)
    if not youtube_id or submission_pending then return end
    local start_time = math.min(segment.a, segment.b)
    local end_time = math.max(segment.a, segment.b)
    if end_time - start_time == 0 or end_time == 0 then
        mp.osd_message("[sponsorblock] empty segment, not submitting")
    elseif segment.progress <= 1 then
        segment.progress = segment.progress + 2
        local category_list = ""
        for category_id, category in pairs(all_categories) do
            local category_title = (category:gsub("^%l", string.upper):gsub("_", " "))
            category_list = category_list .. category_id .. ": " .. category_title .. "\n"
            mp.add_forced_key_binding(tostring(category_id), "select_category_"..category, function() select_category(category) end)
            mp.add_forced_key_binding("KP"..tostring(category_id), "kp_select_category_"..category, function() select_category(category) end)
        end
        mp.osd_message(string.format("[sponsorblock] press a number to select category for segment: %.2d:%.2d:%.2d to %.2d:%.2d:%.2d\n\n" .. category_list .. "\nyou can press Shift+G again for default (Sponsor) or hide this message with g", math.floor(start_time/(60*60)), math.floor(start_time/60%60), math.floor(start_time%60), math.floor(end_time/(60*60)), math.floor(end_time/60%60), math.floor(end_time%60)), 30)
    else
        local uid = get_user_id()
        if not uid then return end
        mp.osd_message("[sponsorblock] submitting segment...", 30)
        local generation = file_generation
        local submitted_category = category or "sponsor"
        submission_pending = true
        request("POST", "skipSegments", nil, {videoID = youtube_id, userID = uid,
            segments = {{segment = {start_time, end_time}, category = submitted_category}}}, function(success, _, status)
            if generation ~= file_generation then return end
            submission_pending = false
            if success then
                segment = {a = 0, b = 0, progress = 0, first = true}
                mp.osd_message("[sponsorblock] segment submitted")
                preview_segment = nil
                segment_cache["submitted:" .. start_time .. ":" .. end_time] = {
                    start_time = start_time, end_time = end_time, category = submitted_category,
                    title = category_titles[submitted_category] or submitted_category,
                }
                publish_segments()
            else
                local errors = {[400] = "invalid segment", [409] = "segment already submitted", [429] = "rate limited; try again"}
                mp.osd_message("[sponsorblock] " .. (errors[status] or "segment submission failed; try again"), 5)
            end
        end)
    end
end

function select_category(selected)
    for category in string.gmatch(options.categories, "([^,]+)") do
        mp.remove_key_binding("select_category_"..category)
        mp.remove_key_binding("kp_select_category_"..category)
    end
    submit_segment(selected)
end

local function file_loaded()
    local initialized = init
    file_generation = file_generation + 1
    submission_pending = false
    ranges = {}
    segment = {a = 0, b = 0, progress = 0, first = true}
    last_skip = {uuid = "", dir = nil}
    segment_cache = {}
    preview_segment = nil
    original_chapters = mp.get_property_native("chapter-list", {})
    published_chapters = nil
    publish_segments()
    local video_path = mp.get_property("path", "")
    mp.msg.debug("Path: " .. video_path)
    local video_referer = string.match(mp.get_property("http-header-fields", ""), "Referer:([^,]+)") or ""
    mp.msg.debug("Referer: " .. video_referer)

    local urls = {
        "ytdl://([%w-_]+).*",
        "https?://youtu%.be/([%w-_]+).*",
        "https?://w?w?w?%.?youtube%.com/v/([%w-_]+).*",
        "/watch.*[?&]v=([%w-_]+).*",
        "/embed/([%w-_]+).*"
    }
    youtube_id = nil
    for i, url in ipairs(urls) do
        youtube_id = youtube_id or string.match(video_path, url) or string.match(video_referer, url)
        if youtube_id then break end
    end
    youtube_id = youtube_id or string.match(video_path, options.local_pattern)

    if not youtube_id or string.len(youtube_id) < 11 or (options.local_pattern and string.len(youtube_id) ~= 11) then return end
    youtube_id = string.sub(youtube_id, 1, 11)
    mp.msg.debug("Found YouTube ID: " .. youtube_id)
    init = true
    getranges()
    if initialized then return end
    if options.skip then
        mp.observe_property("time-pos", "native", skip_ads)
    end
    if options.display_name ~= "" then
        local uid = get_user_id()
        if uid then
            request("POST", "setUsername", {userID = uid, username = options.display_name}, nil, function(success)
                if not success then mp.msg.warn("[sponsorblock] could not set display name") end
            end)
        end
    end
end

local function set_segment()
    if not youtube_id or submission_pending then return end
    local pos = mp.get_property_number("time-pos")
    if pos == nil then return end
    if segment.progress > 1 then
        segment.progress = segment.progress - 2
    end
    if segment.progress == 1 then
        segment.progress = 0
        segment.b = pos
        mp.osd_message("[sponsorblock] segment boundary B set, press again for boundary A", 3)
    else
        segment.progress = 1
        segment.a = pos
        mp.osd_message("[sponsorblock] segment boundary A set, press again for boundary B", 3)
    end
    if not segment.first then
        local start_time = math.min(segment.a, segment.b)
        local end_time = math.max(segment.a, segment.b)
        if end_time - start_time ~= 0 and end_time ~= 0 then
            preview_segment = {
                start_time = start_time, end_time = end_time,
                category = "preview", title = "Preview segment",
            }
            publish_segments()
        end
    end
    segment.first = false
end

-- Automatically migrate files if needed
for new, old in pairs({
      [uid_path]      = expand_path("~~/scripts/sponsorblock_shared/sponsorblock.txt"),
}) do
   mp.msg.debug(old .. " → " .. new)
   if file_exists(old) and not file_exists(new) and new ~= "" then
      mp.msg.info("Migrating " .. old)
      os.rename(old, new)
   end
end

mp.register_event("file-loaded", file_loaded)
mp.register_event("end-file", function()
    file_generation = file_generation + 1
    submission_pending = false
    youtube_id = nil
    ranges = {}
    segment_cache = {}
    preview_segment = nil
    original_chapters = nil
    published_chapters = nil
    mp.set_property_native("user-data/sponsorblock/segments", {})
end)
mp.observe_property("chapter-list", "native", function(_, chapters)
    if not original_chapters or not chapters or same_chapters(chapters, published_chapters) then return end
    original_chapters = chapters
    publish_segments()
end)
mp.observe_property("duration", "number", function()
    publish_segments()
end)
mp.observe_property("user-data/modernz/sponsorblock-edge-tolerance", "number", function()
    publish_segments()
end)
mp.add_key_binding("g", "set_segment", set_segment)
mp.add_key_binding("G", "submit_segment", submit_segment)
mp.add_key_binding("h", "upvote_segment", function() return vote("1") end)
mp.add_key_binding("H", "downvote_segment", function() return vote("0") end)
