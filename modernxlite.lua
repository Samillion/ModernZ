-- mpv-osc-modern by maoiscat
-- email:valarmor@163.com
-- https://github.com/maoiscat/mpv-osc-modern

-- fork by cyl0 - https://github.com/cyl0/ModernX/

-- further fork by zydezu

-- added some changes from dexeonify - https://github.com/dexeonify/mpv-config#difference-between-upstream-modernx

local assdraw = require 'mp.assdraw'
local msg = require 'mp.msg'
local utils = require 'mp.utils'

-- Parameters
-- default user option values
-- change them using osc.conf
local user_opts = {
    -- general settings --
    language = 'en',                -- en:English, chs:Chinese, pl:Polish, jp:Japanese
    welcomescreen = true,           -- show the mpv 'play files' screen upon open
    windowcontrols = 'auto',        -- whether to show OSC window controls, 'auto', 'yes' or 'no'
    showwindowed = true,            -- show OSC when windowed?
    showfullscreen = true,          -- show OSC when fullscreen?
    noxmas = false,                 -- disable santa hat in December
    keybindings = true,             -- register keybindings i.e. chapter scrubbing, pinning window
    
    -- scaling settings --
    vidscale = false,               -- whether to scale the controller with the video
    scalewindowed = 1.0,            -- scaling of the controller when windowed
    scalefullscreen = 1.0,          -- scaling of the controller when fullscreen
    scaleforcedwindow = 1.0,        -- scaling when rendered on a forced window

    -- interface settings --
    hidetimeout = 2000,             -- duration in ms until OSC hides if no mouse movement
    fadeduration = 150,             -- duration of fade out in ms, 0 = no fade
    minmousemove = 0,               -- amount of pixels the mouse has to move for OSC to show
    scrollingSpeed = 40,            -- the speed of scrolling text in menus
    showonpause = true,             -- whether to show to osc when paused
    donttimeoutonpause = false,     -- whether to disable the hide timeout on pause
    bottomhover = true,             -- if the osc should only display when hovering at the bottom
    raisesubswithosc = true,        -- whether to raise subtitles above the osc when it's shown
    thumbnailborder = 2,            -- the width of the thumbnail border
    persistentprogress = false,     -- always show a small progress line at the bottom of the screen
    persistentprogressheight = 17,  -- the height of the persistentprogress bar
    persistentbuffer = false,       -- on web videos, show the buffer on the persistent progress line
    persistentprogresstoggle = true,-- enable toggling the persistentprogress bar

    -- title and chapter settings --
    showtitle = true,               -- show title in OSC
    showdescription = true,         -- show video description on web videos
    showwindowtitle = true,         -- show window title in borderless/fullscreen mode
    showfilesize = true,            -- show the current file's size in the description
    titleBarStrip = true,           -- whether to make the title bar a singular bar instead of a black fade
    title = '${media-title}',       -- title shown on OSC - turn off dynamictitle for this option to apply
    dynamictitle = true,            -- change the title depending on if {media-title} and {filename} 
                                    -- differ (like with playing urls, audio or some media)
    updatetitleyoutubestats = true, -- update the window/OSC title bar with YouTube video stats (views, likes, dislikes)
    font = 'mpv-osd-symbols',       -- mpv-osd-symbols = default osc font (or the one set in mpv.conf)
                                    -- to be shown as OSC title
    titlefontsize = 30,             -- the font size of the title text
    chapterformat = 'Chapter: %s',  -- chapter print format for seekbar-hover. "no" to disable
    dateformat = "%Y-%m-%d",        -- how dates should be formatted, when read from metadata (uses standard lua date formatting)
    osc_color = '#000000',           -- accent of the OSC and the title bar, in Hex color format
    OSCfadealpha = 150,             -- alpha of the background box for the OSC
    boxalpha = 75,                  -- alpha of the window title bar
    descriptionfontsize = 19,       -- alpha of the description background box
    descriptionBoxAlpha = 100,      -- alpha of the description background box

    -- seekbar settings --
    seekbarfg_color = '#429CE3',     -- color of the seekbar progress and handle, in Hex color format
    seekbarbg_color = '#FFFFFF',     -- color of the remaining seekbar, in Hex color format
    seekbarkeyframes = false,       -- use keyframes when dragging the seekbar
    automatickeyframemode = true,   -- set seekbarkeyframes based on video length to prevent laggy scrubbing on long videos 
    automatickeyframelimit = 600,   -- videos of above this length (in seconds) will have seekbarkeyframes on
    seekbarhandlesize = 0.8,        -- size ratio of the slider handle, range 0 ~ 1
    seekrange = true,               -- show seekrange overlay
    seekrangealpha = 150,           -- transparency of seekranges
    iconstyle = 'round',            -- icon style, 'solid' or 'round'
    hovereffect = true,             -- whether buttons have a glowing effect when hovered over

    -- button settings --
    timetotal = true,               -- display total time instead of remaining time by default
    timems = false,                 -- show time as milliseconds by default
    timefontsize = 18,              -- the font size of the time
    jumpamount = 5,                 -- change the jump amount (in seconds by default)
    jumpiconnumber = true,          -- show different icon when jumpamount is 5, 10, or 30
    jumpmode = 'relative',          -- seek mode for jump buttons - https://mpv.io/manual/stable/#command-interface-seek-%3Ctarget%3E-[%3Cflags%3E]
    volumecontrol = true,           -- whether to show mute button and volume slider
    volumecontroltype = 'linear',   -- use 'linear' or 'log' (logarithmic) volume scale
    showjump = true,                -- show "jump forward/backward 5 seconds" buttons 
    showskip = true,                -- show the skip back and forward (chapter) buttons
    compactmode = true,             -- replace the jump buttons with the chapter buttons, clicking the
                                    -- buttons will act as jumping, and shift clicking will act as
                                    -- skipping a chapter
    showloop = true,                -- show the loop button
    loopinpause = true,             -- activate looping by right clicking pause
    showontop = true,               -- show window on top button
    showinfo = false,               -- show the info button
    downloadbutton = true,          -- show download button for web videos
    screenshotbutton = false,        -- show screenshot button
    downloadpath = "~~desktop/mpv/downloads", -- the download path for videos
    showyoutubecomments = false,    -- EXPERIMENTAL - not ready
    commentsdownloadpath = "~~desktop/mpv/downloads/comments", -- the download path for the comment JSON file
    ytdlpQuality = '' -- optional parameteres for yt-dlp downloading, eg: '-f bestvideo[vcodec^=avc][ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best'
}



-- Icons for jump button depending on jumpamount 
local jumpicons = { 
    [5] = {'\239\142\177', '\239\142\163'}, 
    [10] = {'\239\142\175', '\239\142\161'}, 
    [30] = {'\239\142\176', '\239\142\162'}, 
    default = {'\239\142\178    ', '\239\142\178'}, -- second icon is mirrored in layout() 
} 

local icons = {
  previous = '\239\142\181',
  next = '\239\142\180',
  play = '\239\142\170',
  pause = '\239\142\167',
  replay = '', -- copied private use character
  backward = '\239\142\160',
  forward = '\239\142\159',
  audio = '\239\142\183',
  volume = '\239\142\188',
  volumelow = '\239\142\185',
  volumemute = '\239\142\187',
  sub = '\239\140\164',
  minimize = '\239\133\172',
  fullscreen = '\239\133\173',  
  loopoff = '',
  loopon = '', 
  info = '\239\135\183',
  download = '\239\136\160',
  downloading = '\239\134\185',
  ontopon = '\239\142\150',
  ontopoff = '\239\142\149',
  screenshot = ''
}

local emoticon = {
    view = "👁️",
    comment = "💬",
    like = "👍",
    dislike = "👎"
}

-- Localization
local language = {
    ['en'] = {
        welcome = '{\\fs24\\1c&H0&\\1c&HFFFFFF&}Drop files or URLs to play here.',  -- this text appears when mpv starts
        off = 'OFF',
        na = 'n/a',
        none = 'None available',
        video = 'Video',
        audio = 'Audio',
        subtitle = 'Subtitle',
        nosub = 'No subtitles available',
        noaudio = 'No audio tracks available',
        track = ' tracks:',
        playlist = 'Playlist',
        nolist = 'Empty playlist.',
        chapter = 'Chapter',
        nochapter = 'No chapters.',
        ontop = 'Pin window',
        ontopdisable = 'Unpin window',
        loopenable = 'Enable looping',
        loopdisable = 'Disable looping',
    },
    ['chs'] = {
        welcome = '{\\fs24\\1c&H0&\\1c&HFFFFFF&}将文件或URL放在这里播放',  -- this text appears when mpv starts
        off = '关闭',
        na = 'n/a',
        none = '无数据',
        video = '视频',
        audio = '音频',
        subtitle = '字幕',
        nosub = "没有字幕", -- please check these translations
        noaudio = "不提供音轨", -- please check these translations
        track = '：',
        playlist = '播放列表',
        nolist = '无列表信息',
        chapter = '章节',
        nochapter = '无章节信息',
        ontop = '启用窗口停留在顶层',  -- please check these translations
        ontopdisable = '禁用停留在顶层的窗口',  -- please check these translations
        loopenable = '启用循环功能',
        loopdisable = '禁用循环功能',
    },
    ['pl'] = {
        welcome = '{\\fs24\\1c&H0&\\1c&HFFFFFF&}Upuść plik lub łącze URL do odtworzenia.',  -- this text appears when mpv starts
        off = 'WYŁ.',
        na = 'n/a',
        none = 'nic',
        video = 'Wideo',
        audio = 'Audio',
        subtitle = 'Napisy',
        nosub = 'Brak dostępnych napisów', -- please check these translations
        noaudio = 'Brak dostępnych ścieżek dźwiękowych', -- please check these translations
        track = ' ścieżki:',
        playlist = 'Lista odtwarzania',
        nolist = 'Lista odtwarzania pusta.',
        chapter = 'Rozdział',
        nochapter = 'Brak rozdziałów.',
        ontop = 'Przypnij okno do góry',
        ontopdisable = 'Odepnij okno od góry',
        loopenable = 'Włączenie zapętlenia',
        loopdisable = 'Wyłączenie zapętlenia',
    },
    ['jp'] = {
        welcome = '{\\fs24\\1c&H0&\\1c&HFFFFFF&}ファイルやURLのリンクをここにドロップすると再生されます。',  -- this text appears when mpv starts
        off = 'OFF',
        na = 'n/a',
        none = 'なし',
        video = 'ビデオ',
        audio = 'オーディオ',
        subtitle = 'サブタイトル',
        nosub = '字幕はありません',
        noaudio = 'オーディオトラックはありません',
        track = 'トラック:',
        playlist = 'プレイリスト',
        nolist = '空のプレイリスト.',
        chapter = 'チャプター',
        nochapter = '利用可能なチャプターはありません.',
        ontop = 'ピンウィンドウをトップに表示',
        ontopdisable = 'ウィンドウを上からアンピンする',
        loopenable = 'ループON',
        loopdisable = 'ループOFF',
    }
}
-- read options from config and command-line
(require 'mp.options').read_options(user_opts, 'modernx', function(list) update_options(list) end)
-- apply lang opts
local texts = language[user_opts.language]
local osc_param = {                         -- calculated by osc_init()
    playresy = 0,                           -- canvas size Y
    playresx = 0,                           -- canvas size X
    display_aspect = 1,
    unscaled_y = 0,
    areas = {},
}

local iconfont = user_opts.iconstyle == 'round' and 'Material-Design-Iconic-Round' or 'Material-Design-Iconic-Font'

local function osc_color_convert(color)
    return color:sub(6,7) .. color:sub(4,5) ..  color:sub(2,3)
end

local osc_styles = {
    TransBg = "{\\blur100\\bord" .. user_opts.OSCfadealpha .. "\\1c&H000000&\\3c&H" .. osc_color_convert(user_opts.osc_color) .. "&}",
    SeekbarBg = "{\\blur0\\bord0\\1c&H" .. osc_color_convert(user_opts.seekbarbg_color) .. "&}",
    SeekbarFg = "{\\blur1\\bord1\\1c&H" .. osc_color_convert(user_opts.seekbarfg_color) .. "&}",
    VolumebarBg = '{\\blur0\\bord0\\1c&H999999&}',
    VolumebarFg = '{\\blur1\\bord1\\1c&HFFFFFF&}',
    Ctrl1 = '{\\blur0\\bord0\\1c&HFFFFFF&\\3c&HFFFFFF&\\fs36\\fn' .. iconfont .. '}',
    Ctrl2 = '{\\blur0\\bord0\\1c&HFFFFFF&\\3c&HFFFFFF&\\fs24\\fn' .. iconfont .. '}',
    Ctrl2Flip = '{\\blur0\\bord0\\1c&HFFFFFF&\\3c&HFFFFFF&\\fs24\\fn' .. iconfont .. '\\fry180',
    Ctrl3 = '{\\blur0\\bord0\\1c&HFFFFFF&\\3c&HFFFFFF&\\fs24\\fn' .. iconfont .. '}',
    Time = '{\\blur0\\bord0\\1c&HFFFFFF&\\3c&H000000&\\fs' .. user_opts.timefontsize .. '\\fn' .. user_opts.font .. '}',
    Tooltip = '{\\blur1\\bord0.5\\1c&HFFFFFF&\\3c&H000000&\\fs' .. user_opts.timefontsize .. '\\fn' .. user_opts.font .. '}',
    Title = '{\\blur1\\bord0.5\\1c&HFFFFFF&\\3c&H0\\fs'.. user_opts.titlefontsize ..'\\q2\\fn' .. user_opts.font .. '}',
    WindowTitle = '{\\blur1\\bord0.5\\1c&HFFFFFF&\\3c&H0\\fs'.. 18 ..'\\q2\\fn' .. user_opts.font .. '}',
    Description = '{\\blur1\\bord0.5\\1c&HFFFFFF&\\3c&H000000&\\fs'.. user_opts.descriptionfontsize ..'\\q2\\fn' .. user_opts.font .. '}',
    WinCtrl = '{\\blur1\\bord0.5\\1c&HFFFFFF&\\3c&H0\\fs20\\fnmpv-osd-symbols}',
    elementDown = '{\\1c&H999999&}',
    elementHover = "{\\blur5\\2c&HFFFFFF&}",
    wcBar = "{\\1c&H" .. osc_color_convert(user_opts.osc_color) .. "}",
}

-- internal states, do not touch
local state = {
    showtime,                               -- time of last invocation (last mouse move)
    osc_visible = false,
    anistart,                               -- time when the animation started
    anitype,                                -- current type of animation
    animation,                              -- current animation alpha
    mouse_down_counter = 0,                 -- used for softrepeat
    active_element = nil,                   -- nil = none, 0 = background, 1+ = see elements[]
    active_event_source = nil,              -- the 'button' that issued the current event
    touchingprogressbar = false,                 -- if the mouse is touching the progress bar
    rightTC_trem = not user_opts.timetotal, -- if the right timecode should display total or remaining time
    mp_screen_sizeX, mp_screen_sizeY,       -- last screen-resolution, to detect resolution changes to issue reINITs
    initREQ = false,                        -- is a re-init request pending?
    last_mouseX, last_mouseY,               -- last mouse position, to detect significant mouse movement
    sliderpos = 0,
    mouse_in_window = false,
    message_text,
    message_hide_timer,
    fullscreen = false,
    tick_timer = nil,
    tick_last_time = 0,                     -- when the last tick() was run
    initialborder = mp.get_property('border'),
    hide_timer = nil,
    cache_state = nil,
    idle = false,
    playingWhilstSeeking = false,
    playingWhilstSeekingWaitingForEnd = false,
    enabled = true,
    input_enabled = true,
    showhide_enabled = false,
    border = true,
    maximized = false,
    osd = mp.create_osd_overlay('ass-events'),
    mute = false,
    fulltime = user_opts.timems,
    chapter_list = {},                      -- sorted by time
    looping = false,
    videoDescription = "",                  -- fill if it is a YouTube
    descriptionLoaded = false,
    showingDescription = false,
    downloadedOnce = false,
    downloadFileName = "",
    scrolledlines = 25,
    isWebVideo = false,
    path = "",                               -- used for yt-dlp downloading
    downloading = false,
    fileSizeBytes = 0,
    fileSizeNormalised = "Approximating size...",
    localDescription = nil,
    localDescriptionClick = nil,
    localDescriptionIsClickable = false,
    videoCantBeDownloaded = false,
    youtubeuploader = "",
    youtubecomments = {},
    commentsParsed = false,
    currentCommentIndex = 0,
    commentsPage = 0,
    maxCommentPages = 0,
    commentsAdditionalText = "",
    persistentprogresstoggle = user_opts.persistentprogress,
}

local thumbfast = {
    width = 0,
    height = 0,
    disabled = true,
    available = false
}

local maxdescsize = 125
local commentsperpage = 25

local window_control_box_width = 138
local tick_delay = 0.01 -- 100FPS

local is_december = os.date("*t").month == 12

--- Automatically disable OSC
local builtin_osc_enabled = mp.get_property_native('osc')
if builtin_osc_enabled then
    mp.set_property_native('osc', false)
end

--
-- Helperfunctions
--

function kill_animation()
    state.anistart = nil
    state.animation = nil
    state.anitype = nil
end

function set_osd(res_x, res_y, text)
    if state.osd.res_x == res_x and
       state.osd.res_y == res_y and
       state.osd.data == text then
        return
    end
    state.osd.res_x = res_x
    state.osd.res_y = res_y
    state.osd.data = text
    state.osd.z = 1000
    state.osd:update()
end

-- scale factor for translating between real and virtual ASS coordinates
function get_virt_scale_factor()
    local w, h = mp.get_osd_size()
    if w <= 0 or h <= 0 then
        return 0, 0
    end
    return osc_param.playresx / w, osc_param.playresy / h
end

-- return mouse position in virtual ASS coordinates (playresx/y)
function get_virt_mouse_pos()
    if state.mouse_in_window then
        local sx, sy = get_virt_scale_factor()
        local x, y = mp.get_mouse_pos()
        return x * sx, y * sy
    else
        return -1, -1
    end
end

function set_virt_mouse_area(x0, y0, x1, y1, name)
    local sx, sy = get_virt_scale_factor()
    mp.set_mouse_area(x0 / sx, y0 / sy, x1 / sx, y1 / sy, name)
end

function scale_value(x0, x1, y0, y1, val)
    local m = (y1 - y0) / (x1 - x0)
    local b = y0 - (m * x0)
    return (m * val) + b
end

-- returns hitbox spanning coordinates (top left, bottom right corner)
-- according to alignment
function get_hitbox_coords(x, y, an, w, h)

    local alignments = {
      [1] = function () return x, y-h, x+w, y end,
      [2] = function () return x-(w/2), y-h, x+(w/2), y end,
      [3] = function () return x-w, y-h, x, y end,

      [4] = function () return x, y-(h/2), x+w, y+(h/2) end,
      [5] = function () return x-(w/2), y-(h/2), x+(w/2), y+(h/2) end,
      [6] = function () return x-w, y-(h/2), x, y+(h/2) end,

      [7] = function () return x, y, x+w, y+h end,
      [8] = function () return x-(w/2), y, x+(w/2), y+h end,
      [9] = function () return x-w, y, x, y+h end,
    }

    return alignments[an]()
end

function get_hitbox_coords_geo(geometry)
    return get_hitbox_coords(geometry.x, geometry.y, geometry.an,
        geometry.w, geometry.h)
end

function get_element_hitbox(element)
    return element.hitbox.x1, element.hitbox.y1,
        element.hitbox.x2, element.hitbox.y2
end

function mouse_hit(element)
    return mouse_hit_coords(get_element_hitbox(element))
end

function mouse_hit_coords(bX1, bY1, bX2, bY2)
    local mX, mY = get_virt_mouse_pos()
    return (mX >= bX1 and mX <= bX2 and mY >= bY1 and mY <= bY2)
end

function limit_range(min, max, val)
    if val > max then
        val = max
    elseif val < min then
        val = min
    end
    return val
end

-- translate value into element coordinates
function get_slider_ele_pos_for(element, val)

    local ele_pos = scale_value(
        element.slider.min.value, element.slider.max.value,
        element.slider.min.ele_pos, element.slider.max.ele_pos,
        val)

    return limit_range(
        element.slider.min.ele_pos, element.slider.max.ele_pos,
        ele_pos)
end

-- translates global (mouse) coordinates to value
function get_slider_value_at(element, glob_pos)
    if (element) then
        local val = scale_value(
            element.slider.min.glob_pos, element.slider.max.glob_pos,
            element.slider.min.value, element.slider.max.value,
            glob_pos)
        return limit_range(
            element.slider.min.value, element.slider.max.value,
            val)
    end

    -- fall back incase of loading errors
    return 0
end

-- get value at current mouse position
function get_slider_value(element)
    return get_slider_value_at(element, get_virt_mouse_pos())
end

-- multiplies two alpha values, formular can probably be improved
function mult_alpha(alphaA, alphaB)
    return 255 - (((1-(alphaA/255)) * (1-(alphaB/255))) * 255)
end

function add_area(name, x1, y1, x2, y2)
    -- create area if needed
    if (osc_param.areas[name] == nil) then
        osc_param.areas[name] = {}
    end
    table.insert(osc_param.areas[name], {x1=x1, y1=y1, x2=x2, y2=y2})
end

function ass_append_alpha(ass, alpha, modifier, inverse)
    local ar = {}

    for ai, av in pairs(alpha) do
        av = mult_alpha(av, modifier)
        if state.animation then
            local animpos = state.animation
            if inverse then
                animpos = 255 - animpos
            end
            av = mult_alpha(av, animpos)
        end
        ar[ai] = av
    end

    ass:append(string.format('{\\1a&H%X&\\2a&H%X&\\3a&H%X&\\4a&H%X&}',
               ar[1], ar[2], ar[3], ar[4]))
end

function ass_draw_cir_cw(ass, x, y, r)
    ass:round_rect_cw(x-r, y-r, x+r, y+r, r)
end

function ass_draw_rr_h_cw(ass, x0, y0, x1, y1, r1, hexagon, r2)
    if hexagon then
        ass:hexagon_cw(x0, y0, x1, y1, r1, r2)
    else
        ass:round_rect_cw(x0, y0, x1, y1, r1, r2)
    end
end

function ass_draw_rr_h_ccw(ass, x0, y0, x1, y1, r1, hexagon, r2)
    if hexagon then
        ass:hexagon_ccw(x0, y0, x1, y1, r1, r2)
    else
        ass:round_rect_ccw(x0, y0, x1, y1, r1, r2)
    end
end


--
-- Tracklist Management
--

local nicetypes = {video = texts.video, audio = texts.audio, sub = texts.subtitle}

-- updates the OSC internal playlists, should be run each time the track-layout changes
function update_tracklist()
    local tracktable = mp.get_property_native('track-list', {})

    -- by osc_id
    tracks_osc = {}
    tracks_osc.video, tracks_osc.audio, tracks_osc.sub = {}, {}, {}
    -- by mpv_id
    tracks_mpv = {}
    tracks_mpv.video, tracks_mpv.audio, tracks_mpv.sub = {}, {}, {}
    for n = 1, #tracktable do
        if not (tracktable[n].type == 'unknown') then
            local type = tracktable[n].type
            local mpv_id = tonumber(tracktable[n].id)

            -- by osc_id
            table.insert(tracks_osc[type], tracktable[n])

            -- by mpv_id
            tracks_mpv[type][mpv_id] = tracktable[n]
            tracks_mpv[type][mpv_id].osc_id = #tracks_osc[type]
        end
    end
end

-- return a nice list of tracks of the given type (video, audio, sub)
function get_tracklist(type)
    local msg =  nicetypes[type] .. texts.track
    if not tracks_osc or #tracks_osc[type] == 0 then
        msg = texts.none
    else
        for n = 1, #tracks_osc[type] do
            local track = tracks_osc[type][n]
            local lang, title, selected = 'unknown', '', '○'
            if not(track.lang == nil) then lang = track.lang end
            if not(track.title == nil) then title = track.title end
            if (track.id == tonumber(mp.get_property(type))) then
                selected = '●'
            end
            msg = msg..'\n'..selected..' '..n..': ['..lang..'] '..title
        end
    end
    return msg
end

-- relatively change the track of given <type> by <next> tracks
    --(+1 -> next, -1 -> previous)
function set_track(type, next)
    local current_track_mpv, current_track_osc
    current_track_osc = 0
    if (mp.get_property(type) == 'no') then
        current_track_osc = 0
    else
        current_track_mpv = tonumber(mp.get_property(type))
        if (tracks_mpv[type][current_track_mpv]) then
            current_track_osc = tracks_mpv[type][current_track_mpv].osc_id
        end
    end
    local new_track_osc = (current_track_osc + next) % (#tracks_osc[type] + 1)
    local new_track_mpv
    if new_track_osc == 0 then
        new_track_mpv = 'no'
    else
        new_track_mpv = tracks_osc[type][new_track_osc].id
    end

    mp.commandv('set', type, new_track_mpv)
end

-- get the currently selected track of <type>, OSC-style counted
function get_track(type)
    local track = mp.get_property(type)
    if track ~= 'no' and track ~= nil then
        local tr = tracks_mpv[type][tonumber(track)]
        if tr then
            return tr.osc_id
        end
    end
    return 0
end

-- convert slider_pos to logarithmic depending on volumecontrol user_opts
function set_volume(slider_pos)
    local volume = slider_pos
    if user_opts.volumecontroltype == "log" then
        volume = slider_pos^2 / 100
    end
    return math.floor(volume)
end

-- WindowControl helpers
function window_controls_enabled()
    val = user_opts.windowcontrols
    if val == 'auto' then
        return (not state.border) or state.fullscreen
    else
        return val ~= 'no'
    end
end

function window_controls_alignment()
    return user_opts.windowcontrols_alignment
end

--
-- Element Management
--

local elements = {}

function prepare_elements()

    -- remove elements without layout or invisble
    local elements2 = {}
    for n, element in pairs(elements) do
        if not (element.layout == nil) and (element.visible) then
            table.insert(elements2, element)
        end
    end
    elements = elements2

    function elem_compare (a, b)
        return a.layout.layer < b.layout.layer
    end

    table.sort(elements, elem_compare)


    for _,element in pairs(elements) do

        local elem_geo = element.layout.geometry

        -- Calculate the hitbox
        local bX1, bY1, bX2, bY2 = get_hitbox_coords_geo(elem_geo)
        element.hitbox = {x1 = bX1, y1 = bY1, x2 = bX2, y2 = bY2}

        local style_ass = assdraw.ass_new()

        -- prepare static elements
        style_ass:append('{}') -- hack to troll new_event into inserting a \n
        style_ass:new_event()
        style_ass:pos(elem_geo.x, elem_geo.y)
        style_ass:an(elem_geo.an)
        style_ass:append(element.layout.style)

        element.style_ass = style_ass

        local static_ass = assdraw.ass_new()


        if (element.type == 'box') then
            --draw box
            static_ass:draw_start()
            ass_draw_rr_h_cw(static_ass, 0, 0, elem_geo.w, elem_geo.h,
                             element.layout.box.radius, element.layout.box.hexagon)
            static_ass:draw_stop()

        elseif (element.type == 'slider') then
            --draw static slider parts
            local slider_lo = element.layout.slider
            -- calculate positions of min and max points
            element.slider.min.ele_pos = user_opts.seekbarhandlesize * elem_geo.h / 2
            element.slider.max.ele_pos = elem_geo.w - element.slider.min.ele_pos
            element.slider.min.glob_pos = element.hitbox.x1 + element.slider.min.ele_pos
            element.slider.max.glob_pos = element.hitbox.x1 + element.slider.max.ele_pos

            static_ass:draw_start()
            -- a hack which prepares the whole slider area to allow center placements such like an=5
            static_ass:rect_cw(0, 0, elem_geo.w, elem_geo.h)
            static_ass:rect_ccw(0, 0, elem_geo.w, elem_geo.h)
            -- marker nibbles
            if not (element.slider.markerF == nil) and (slider_lo.gap > 0) then
                local markers = element.slider.markerF()
                for _,marker in pairs(markers) do
                    if (marker >= element.slider.min.value) and 
                    (marker <= element.slider.max.value) then
                        local s = get_slider_ele_pos_for(element, marker)
                        if (slider_lo.gap > 5) then -- draw triangles
                            --top
                            if (slider_lo.nibbles_top) then
                                static_ass:move_to(s - 3, slider_lo.gap - 5)
                                static_ass:line_to(s + 3, slider_lo.gap - 5)
                                static_ass:line_to(s, slider_lo.gap - 1)
                            end
                            --bottom
                            if (slider_lo.nibbles_bottom) then
                                static_ass:move_to(s - 3, elem_geo.h - slider_lo.gap + 5)
                                static_ass:line_to(s, elem_geo.h - slider_lo.gap + 1)
                                static_ass:line_to(s + 3, elem_geo.h - slider_lo.gap + 5)
                            end
                        else -- draw 2x1px nibbles
                            --top
                            if (slider_lo.nibbles_top) then
                                static_ass:rect_cw(s - 1, 0, s + 1, slider_lo.gap);
                            end
                            --bottom
                            if (slider_lo.nibbles_bottom) then
                                static_ass:rect_cw(s - 1, elem_geo.h - slider_lo.gap, s + 1, elem_geo.h);
                            end
                        end
                    end
                end
            end
        end

        element.static_ass = static_ass

        -- if the element is supposed to be disabled,
        -- style it accordingly and kill the eventresponders
        if not (element.enabled) then
            element.layout.alpha[1] = 215
            if (not (element.name == "cy_sub" or element.name == "cy_audio")) then -- keep these to display tooltips
                element.eventresponder = nil
            end
        end

        -- gray out the element if it is toggled off
        if (element.off) then
            element.layout.alpha[1] = 100
        end
    end
end

--
-- Element Rendering
--

-- returns nil or a chapter element from the native property chapter-list
function get_chapter(possec)
    local cl = state.chapter_list  -- sorted, get latest before possec, if any

    for n=#cl,1,-1 do
        if possec >= cl[n].time then
            return cl[n]
        end
    end
end

function render_persistentprogressbar(master_ass)
    for n=1, #elements do
        local element = elements[n]
        if (element.name == "persistentseekbar") then
            local style_ass = assdraw.ass_new()
            style_ass:merge(element.style_ass)
            ass_append_alpha(style_ass, element.layout.alpha, 0, true)
            
            if not state.animation and state.osc_visible then
                ass_append_alpha(style_ass, element.layout.alpha, 255)
            end
            
            local elem_ass = assdraw.ass_new()
            elem_ass:merge(style_ass)
            if not (element.type == 'button') then
                elem_ass:merge(element.static_ass)
            end

            local slider_lo = element.layout.slider
            local elem_geo = element.layout.geometry
            local s_min = element.slider.min.value
            local s_max = element.slider.max.value
            -- draw pos marker
            local pos = element.slider.posF()
            local seekRanges = element.slider.seekRangesF()
            local rh = 0 -- Handle radius
            local xp
                
            if pos then
                xp = get_slider_ele_pos_for(element, pos)
                ass_draw_cir_cw(elem_ass, xp, elem_geo.h/2, rh)
                elem_ass:rect_cw(0, slider_lo.gap, xp, elem_geo.h - slider_lo.gap)
            end

            if user_opts.persistentbuffer and seekRanges then
                elem_ass:draw_stop()
                elem_ass:merge(element.style_ass)
                ass_append_alpha(elem_ass, element.layout.alpha, user_opts.seekrangealpha, true)
                elem_ass:merge(element.static_ass)
                for _,range in pairs(seekRanges) do
                    local pstart = get_slider_ele_pos_for(element, range['start'])
                    local pend = get_slider_ele_pos_for(element, range['end'])
                    elem_ass:rect_cw(pstart - rh, slider_lo.gap, pend + rh, elem_geo.h - slider_lo.gap)
                end
            end

            elem_ass:draw_stop()
            master_ass:merge(elem_ass)
        end
    end
end

function render_elements(master_ass)
    -- when the slider is dragged or hovered and we have a target chapter name
    -- then we use it instead of the normal title. we calculate it before the
    -- render iterations because the title may be rendered before the slider.
    state.forced_title = nil
    
    -- disable displaying chapter name in title when thumbfast is available
    -- because thumbfast will render it above the thumbnail instead
    if thumbfast.disabled then
        local se, ae = state.slider_element, elements[state.active_element]
        if user_opts.chapterformat ~= "no" and state.touchingprogressbar then
            local dur = mp.get_property_number("duration", 0)
            if dur > 0 then
                local ch = get_chapter(state.sliderpos * dur / 100)
                if ch and ch.title and ch.title ~= "" then
                    state.forced_title = string.format(user_opts.chapterformat, ch.title)
                end
            end
        end
    end
    state.touchingprogressbar = false

    for n=1, #elements do
        local element = elements[n]
        local style_ass = assdraw.ass_new()
        style_ass:merge(element.style_ass)
        ass_append_alpha(style_ass, element.layout.alpha, 0)

        if element.eventresponder and (state.active_element == n) then
            -- run render event functions
            if not (element.eventresponder.render == nil) then
                element.eventresponder.render(element)
            end
            if mouse_hit(element) then
                -- mouse down styling
                if (element.styledown) then
                    style_ass:append(osc_styles.elementDown)
                end
                if (element.softrepeat) and (state.mouse_down_counter >= 15
                    and state.mouse_down_counter % 5 == 0) then

                    element.eventresponder[state.active_event_source..'_down'](element)
                end
                state.mouse_down_counter = state.mouse_down_counter + 1
            end
        end
        
        local elem_ass = assdraw.ass_new()
        elem_ass:merge(style_ass)
        
        if not (element.type == 'button') then
            elem_ass:merge(element.static_ass)
        end

        if (element.type == 'slider') then
            if (element.name ~= "persistentseekbar") then
                local slider_lo = element.layout.slider
                local elem_geo = element.layout.geometry
                local s_min = element.slider.min.value
                local s_max = element.slider.max.value
                -- draw pos marker
                local pos = element.slider.posF()
                local seekRanges = element.slider.seekRangesF()
                local rh = user_opts.seekbarhandlesize * elem_geo.h / 2 -- Handle radius
                local xp
                
                if pos then
                    xp = get_slider_ele_pos_for(element, pos)
                    ass_draw_cir_cw(elem_ass, xp, elem_geo.h/2, rh)
                    elem_ass:rect_cw(0, slider_lo.gap, xp, elem_geo.h - slider_lo.gap)
                end

                if seekRanges then
                    elem_ass:draw_stop()
                    elem_ass:merge(element.style_ass)
                    ass_append_alpha(elem_ass, element.layout.alpha, user_opts.seekrangealpha)
                    elem_ass:merge(element.static_ass)

                    for _,range in pairs(seekRanges) do
                        local pstart = get_slider_ele_pos_for(element, range['start'])
                        local pend = get_slider_ele_pos_for(element, range['end'])
                        elem_ass:rect_cw(pstart - rh, slider_lo.gap, pend + rh, elem_geo.h - slider_lo.gap)
                    end
                end

                elem_ass:draw_stop()
                
                -- add tooltip
                if not (element.slider.tooltipF == nil) then
                    if mouse_hit(element) then
                        local sliderpos = get_slider_value(element)
                        local tooltiplabel = element.slider.tooltipF(sliderpos)
                        local an = slider_lo.tooltip_an
                        local ty
                        if (an == 2) then
                            ty = element.hitbox.y1
                        else
                            ty = element.hitbox.y1 + elem_geo.h/2
                        end

                        local tx = get_virt_mouse_pos()
                        if (slider_lo.adjust_tooltip) then
                            if (an == 2) then
                                if (sliderpos < (s_min + 3)) then
                                    an = an - 1
                                elseif (sliderpos > (s_max - 3)) then
                                    an = an + 1
                                end
                            elseif (sliderpos > (s_max-s_min)/2) then
                                an = an + 1
                                tx = tx - 5
                            else
                                an = an - 1
                                tx = tx + 10
                            end
                        end

                        if (element.name == "seekbar") then
                            state.sliderpos = sliderpos
                        end    
                        
                        -- thumbfast
                        if element.thumbnailable and not thumbfast.disabled then
                            local osd_w = mp.get_property_number("osd-width")
                            local r_w, r_h = get_virt_scale_factor()

                            if osd_w then
                                local hover_sec = 0
                                if (mp.get_property_number("duration")) then hover_sec = mp.get_property_number("duration") * sliderpos / 100 end
                                local thumbPad = user_opts.thumbnailborder
                                local thumbMarginX = 18 / r_w
                                local thumbMarginY = user_opts.timefontsize + thumbPad + 2 / r_h
                                local thumbX = math.min(osd_w - thumbfast.width - thumbMarginX, math.max(thumbMarginX, tx / r_w - thumbfast.width / 2))
                                local thumbY = (ty - thumbMarginY) / r_h - thumbfast.height

                                thumbX = math.floor(thumbX + 0.5)
                                thumbY = math.floor(thumbY + 0.5)

                                if (state.anitype == nil) then
                                    elem_ass:new_event()
                                    elem_ass:pos(thumbX * r_w, ty - thumbMarginY - thumbfast.height * r_h)
                                    elem_ass:an(7)
                                    elem_ass:append(osc_styles.Tooltip)
                                    elem_ass:draw_start()
                                    elem_ass:rect_cw(-thumbPad * r_w, -thumbPad * r_h, (thumbfast.width + thumbPad) * r_w, (thumbfast.height + thumbPad) * r_h)
                                    elem_ass:draw_stop()

                                    -- force tooltip to be centered on the thumb, even at far left/right of screen
                                    tx = (thumbX + thumbfast.width / 2) * r_w
                                    an = 2

                                    mp.commandv("script-message-to", "thumbfast", "thumb", hover_sec, thumbX, thumbY)
                                end

                                
                                -- chapter title
                                local se, ae = state.slider_element, elements[state.active_element]
                                if user_opts.chapterformat ~= "no" and state.touchingprogressbar then
                                    local dur = mp.get_property_number("duration", 0)
                                    if dur > 0 then
                                        local ch = get_chapter(state.sliderpos * dur / 100)
                                        if ch and ch.title and ch.title ~= "" then
                                            elem_ass:new_event()
                                            elem_ass:pos((thumbX + thumbfast.width / 2) * r_w, thumbY * r_h - user_opts.timefontsize / 2)
                                            elem_ass:an(an)
                                            elem_ass:append(slider_lo.tooltip_style)
                                            ass_append_alpha(elem_ass, slider_lo.alpha, 0)
                                            elem_ass:append(string.format(user_opts.chapterformat, ch.title))
                                        end
                                    end
                                end
                            end
                        end

                        -- tooltip label
                        elem_ass:new_event()
                        elem_ass:pos(tx, ty)
                        elem_ass:an(an)
                        elem_ass:append(slider_lo.tooltip_style)
                        ass_append_alpha(elem_ass, slider_lo.alpha, 0)
                        elem_ass:append(tooltiplabel)
                    elseif element.thumbnailable and thumbfast.available then
                        mp.commandv("script-message-to", "thumbfast", "clear")
                    end
                end
            end

        elseif (element.type == 'button') then

            local buttontext
            if type(element.content) == 'function' then
                buttontext = element.content() -- function objects
            elseif not (element.content == nil) then
                buttontext = element.content -- text objects
            end
            buttontext = buttontext:gsub(':%((.?.?.?)%) unknown ', ':%(%1%)')  --gsub('%) unknown %(\'', '')

            local maxchars = element.layout.button.maxchars
            if not (maxchars == nil) and (#buttontext > maxchars) then
                local max_ratio = 1.25  -- up to 25% more chars while shrinking
                local limit = math.max(0, math.floor(maxchars * max_ratio) - 3)
                if (#buttontext > limit) then
                    while (#buttontext > limit) do
                        buttontext = buttontext:gsub(".[\128-\191]*$", "")
                    end
                    buttontext = buttontext .. "..."
                end
                local _, nchars2 = buttontext:gsub(".[\128-\191]*", "")
                local stretch = (maxchars/#buttontext)*100
                buttontext = string.format("{\\fscx%f}",
                    (maxchars/#buttontext)*100) .. buttontext
            end

            elem_ass:append(buttontext)
            
            -- add tooltip for audio and subtitle tracks
            if not (element.tooltipF == nil) then
                if mouse_hit(element) then
                    local tooltiplabel = element.tooltipF
                    local an = 1
                    local ty = element.hitbox.y1
                    local tx = get_virt_mouse_pos()

                    if ty < osc_param.playresy / 2 then
                        ty = element.hitbox.y2
                        an = 7
                    end

                    -- tooltip label
                    if element.enabled then
                        if type(element.tooltipF) == 'function' then
                            tooltiplabel = element.tooltipF()
                        else
                            tooltiplabel = element.tooltipF
                        end
                    else
                        tooltiplabel = element.nothingavailable
                    end

                    if tx > osc_param.playresx / 2 then --move tooltip to left side of mouse cursor
                        tx = tx - string.len(tooltiplabel) * 8
                    end

                    elem_ass:new_event()
                    elem_ass:pos(tx, ty)
                    elem_ass:an(an)
                    elem_ass:append(element.tooltip_style)
                    elem_ass:append(tooltiplabel)
                end
            end

            if user_opts.hovereffect == true then
                -- add hover effect
                -- source: https://github.com/Zren/mpvz/issues/13
                local button_lo = element.layout.button
                local is_clickable = element.eventresponder and (
                    element.eventresponder["mbtn_left_down"] ~= nil or
                    element.eventresponder["mbtn_left_up"] ~= nil
                )
                if mouse_hit(element) and is_clickable and element.enabled then
                    local shadow_ass = assdraw.ass_new()
                    shadow_ass:merge(style_ass)
                    shadow_ass:append(button_lo.hoverstyle .. buttontext)
                    elem_ass:merge(shadow_ass)
                end
            end
        end

        master_ass:merge(elem_ass)
    end
end

--
-- Message display
--

-- pos is 1 based
function limited_list(prop, pos)
    local proplist = mp.get_property_native(prop, {})
    local count = #proplist
    if count == 0 then
        return count, proplist
    end

    local fs = tonumber(mp.get_property('options/osd-font-size'))
    local max = math.ceil(osc_param.unscaled_y * 1.25 / fs)
    if max % 2 == 0 then
        max = max - 1
    end
    local delta = math.ceil(max / 2) - 1
    local begi = math.max(math.min(pos - delta, count - max + 1), 1)
    local endi = math.min(begi + max - 1, count)

    local reslist = {}
    for i=begi, endi do
        local item = proplist[i]
        item.current = (i == pos) and true or nil
        table.insert(reslist, item)
    end
    return count, reslist
end

-- downloading --

function newfilereset()
    request_init()
    state.downloadedOnce = false
    state.videoDescription = "Loading description..."
    state.fileSizeNormalised = "Approximating size..."
    state.localDescription = "Loading..."
    state.localDescriptionIsClickable = false
    state.localDescriptionClick = "Loading..."
    if is_url(mp.get_property("path")) then
        mp.set_property("title", "Loading...")
    end
end

function startupevents()
    state.videoDescription = "Loading description..."
    state.fileSizeNormalised = "Approximating size..."
    state.dateexists = false
    checktitle()
    checkWebLink()
    if user_opts.automatickeyframemode then
        if mp.get_property_number("duration", 0) > user_opts.automatickeyframelimit then
            user_opts.seekbarkeyframes = true
        else
            user_opts.seekbarkeyframes = false
        end
    end
    destroyscrollingkeys() -- close description
end

function checktitle()
    local mediatitle = mp.get_property("media-title")
    mp.set_property("title", mediatitle)

    if (mp.get_property("filename") ~= mediatitle) and user_opts.dynamictitle then
        user_opts.title = "${media-title}"
    end

    -- fake description using metadata
    state.localDescription = nil
    state.localDescriptionClick = nil
    local title = mp.get_property("media-title")
    local artist = mp.get_property("filtered-metadata/by-key/Album_Artist") or mp.get_property("filtered-metadata/by-key/Artist") or mp.get_property("filtered-metadata/by-key/Uploader")
    if (mp.get_property("filtered-metadata/by-key/Album_Artist") and mp.get_property("filtered-metadata/by-key/Artist")) then
        if (mp.get_property("filtered-metadata/by-key/Album_Artist") ~= mp.get_property("filtered-metadata/by-key/Artist")) then
            artist = mp.get_property("filtered-metadata/by-key/Album_Artist") .. ', ' .. mp.get_property("filtered-metadata/by-key/Artist")
        end
    end
    local album = mp.get_property("filtered-metadata/by-key/Album")
    local description = mp.get_property("filtered-metadata/by-key/Description")
    local date = mp.get_property("filtered-metadata/by-key/Date")

    state.ytdescription = ""
    state.youtubeuploader = artist
    if mp.get_property_native('metadata') then
        state.ytdescription = mp.get_property_native('metadata').ytdl_description or description or ""
        -- print("Metadata: " .. utils.to_string(mp.get_property_native('metadata')))
    else
        -- print("Failed to load metadata")
    end

    if user_opts.showdescription then
        if (title) then
            if (#state.ytdescription > 1) then
                state.localDescriptionClick = title .. "\\N----------\\N" .. state.ytdescription .. "\\N----------\\N"

                local utf8split, lastchar = splitUTF8(state.ytdescription, maxdescsize)
                -- print("SPLIT:"..#utf8split.."/"..#state.ytdescription)

                if #utf8split ~= #state.ytdescription then
                    tmp = utf8split:match("^%s*(.-)%s*$")
                    tmp = utf8split:gsub("[,%.%s]+$", "")
                
                    utf8split = tmp .. "..."
                end
                utf8split = utf8split:match("^(.-)%s*$")
                local artisttext = "By: "
                if (is_url(mp.get_property("path"))) then
                    artisttext = "Uploader: "
                end
                if (artist) then
                    utf8split = utf8split .. " | " .. artisttext .. artist
                    state.localDescriptionClick = state.localDescriptionClick ..  artisttext .. artist
                end
                state.descriptionLoaded = true
                state.videoDescription = utf8split:gsub("\r", ""):gsub("\n", " ")
                state.localDescription = state.videoDescription
            else
                state.localDescriptionClick = title .. "\\N----------\\N"
            end
        end
        if (artist ~= nil) then
            if (state.localDescription == nil) then
                state.localDescription = artist
                state.localDescriptionClick = state.localDescriptionClick .. state.localDescription
                state.localDescriptionIsClickable = true
            end
        end
        if (album ~= nil) then
            if (state.localDescription == nil) then -- only metadata
                state.localDescription = "Album: " .. album
                state.localDescriptionClick = state.localDescriptionClick .. state.localDescription
                state.localDescriptionIsClickable = true
            else -- append to other metadata
                if (state.localDescriptionClick ~= nil) then 
                    state.localDescriptionClick = state.localDescriptionClick .. " | " .. album
                else
                    state.localDescriptionClick = album
                    state.localDescriptionIsClickable = true
                end
                state.localDescription = state.localDescription .. " | " .. album
            end
        end
        if (date ~= nil) then
            state.dateexists = true
            local datenormal = normaliseDate(date)
            local datetext = "Year"
            if (#datenormal > 4) then datetext = "Date" end
            if (state.localDescription == nil) then -- only metadata
                state.localDescription = datetext .. ": " .. datenormal
                state.localDescriptionClick = state.localDescriptionClick .. state.localDescription
                state.localDescriptionIsClickable = true
            else -- append to other metadata
                if (state.localDescriptionClick ~= nil) then
                    state.localDescriptionClick = state.localDescriptionClick .. "\\N" .. datetext .. ": " .. datenormal
                else
                    state.localDescriptionClick = datenormal
                    state.localDescriptionIsClickable = true
                end
                if (artist ~= nil and datetext == "Year") then
                    state.localDescription = state.localDescription .. " (" .. datenormal .. ")"
                end
                -- state.localDescription = state.localDescription .. " | " ..  datetext .. ": " .. datenormal
            end
        end

        local function format_file_size_2dp(file_size)
            local units = {"bytes", "KB", "MB", "GB", "TB"}
            local unit_index = 1
            while file_size >= 1024 and unit_index < #units do
                file_size = file_size / 1024
                unit_index = unit_index + 1
            end
            return string.format("%.2f %s", file_size, units[unit_index])
        end

        if (user_opts.showfilesize) then
            file_size = mp.get_property_native("file-size")
            if (file_size ~= nil) then
                file_size = format_file_size_2dp(file_size)
                if (state.localDescription == nil) then -- only metadata
                    state.localDescription = "Size: " .. file_size
                    state.localDescriptionClick = state.localDescriptionClick .. state.localDescription
                    state.localDescriptionIsClickable = true
                else
                    state.localDescriptionClick = state.localDescriptionClick .. "\\NSize: " .. file_size
                end
            end
        end
    end
end

function normaliseDate(date)
    date = string.gsub(date:gsub("/", ""), "-", "")
    if (#date > 8) then -- YYYYMMDD HHMMSS (plus a time)
        local dateTable = {year = date:sub(1,4), month = date:sub(5,6), day = date:sub(7,8)}
        return os.date(user_opts.dateformat, os.time(dateTable)) .. date:sub(9)
    elseif (#date > 4) then -- YYYYMMDD
        local dateTable = {year = date:sub(1,4), month = date:sub(5,6), day = date:sub(7,8)}
        return os.date(user_opts.dateformat, os.time(dateTable))
    else -- YYYY
        return date
    end
end

function is_url(s)
    if (not s) then
        user_opts.downloadbutton = false
        return false
    end

    return nil ~=
        string.match(s,
            "^[%w]-://[-a-zA-Z0-9@:%._\\+~#=]+%." ..
            "[a-zA-Z0-9()][a-zA-Z0-9()]?[a-zA-Z0-9()]?[a-zA-Z0-9()]?[a-zA-Z0-9()]?[a-zA-Z0-9()]?" ..
            "[-a-zA-Z0-9()@:%_\\+.~#?&/=]*")
end

function checkWebLink()
    state.isWebVideo = false
    state.downloading = false
    state.youtubecomments = {}
    state.commentsParsed = false
    state.currentCommentIndex = 0
    state.commentsPage = 0
    state.maxCommentPages = 0

    local path = mp.get_property("path")
    if not path then return nil end

    if string.find(path, "https://") then
        path = string.gsub(path, "ytdl://", "") -- Strip possible ytdl:// prefix
    else
        path = string.gsub(path, "ytdl://", "https://") -- Strip possible ytdl:// prefix and replace with "https://" if there it isn't there already
    end

    if is_url(path) and path or nil then
        state.isWebVideo = true
        state.path = path
        msg.info("WEB: Video is a web video")

        if user_opts.downloadbutton then
            msg.info("WEB: Loading filesize...")
            local command = { 
                "yt-dlp", 
                "--no-download", 
                "-O%(filesize,filesize_approx)s", 
                path
            }
            exec_filesize(command)
        end

        -- Youtube Return Dislike API
        state.dislikes = ""
        if path:find('youtu%.?be') and (user_opts.showdescription or user_opts.updatetitleyoutubestats) then
            msg.info("WEB: Loading dislike count...")
            local filename = mp.get_property_osd("filename")
            local pattern = "v=([^&]+)"
            local match = string.match(filename, pattern)
            if match then
                exec_dislikes({"curl","https://returnyoutubedislikeapi.com/votes?videoId=" .. match})
            else
                local _, _, videoID = string.find(filename, "([%w_-]+)%?si=")
                if videoID then
                    exec_dislikes({"curl","https://returnyoutubedislikeapi.com/votes?videoId=" .. videoID})
                else
                    msg.info("WEB: Failed to fetch dislikes")
                end
            end
        end

        if user_opts.showdescription then
            msg.info("WEB: Loading video description...")
            local uploader = (state.youtubeuploader and '<$\\N!uploader!\\N$>') or "%(uploader)s"
            local description = (state.ytdescription and '<$\\N!desc!\\N$>') or "%(description)s"
            local command = { 
                "yt-dlp",
                "--no-download", 
                "-O \\N----------\\N" .. description .. "\\N----------\\NUploader: " .. uploader .. "\nUploaded: %(upload_date>".. user_opts.dateformat ..")s\nViews: %(view_count)s\nComments: %(comment_count)s\nLikes: %(like_count)s", 
                path
            }
            exec_description(command)
        end

        if user_opts.showyoutubecomments then
            msg.info("WEB: Downloading comments...")
            checkcomments()
        end
    end
end

function checkcomments()
    function file_exists(file)
        local f = io.open(file, "rb")
        if f then f:close() end
        return f ~= nil
    end              

    function lines_from(file)
        if not file_exists(file) then return {} end
        local lines = {}
        for line in io.lines(file) do 
            lines[#lines + 1] = line
        end
        return lines
    end         

    local ret = mp.command_native_async({
        name = "subprocess",
        args = { 
            "yt-dlp",
            "--skip-download",
            "--write-comments",
            "-o%(id)s",
            "-P " .. mp.command_native({"expand-path", user_opts.commentsdownloadpath}),
            state.path 
        },
        capture_stdout = true,
        capture_stderr = true
    }, function() 
        msg.info("WEB: Downloaded comments")

        local filename = mp.command_native({"expand-path", user_opts.commentsdownloadpath .. '/'}) .. mp.get_property("filename"):gsub("watch%?v=", ""):match("^[^%?&]+") .. ".info.json"
        print(filename)

        if file_exists(filename) then
            msg.info("WEB: Reading comments file...")
            local lines = lines_from(filename)
            state.jsoncomments = utils.parse_json(lines[1]).comments
        else
            msg.info("WEB: Error opening comments file")
            return
        end
        state.maxCommentPages = math.ceil(#state.jsoncomments / commentsperpage)
        if (#state.jsoncomments > 0) then
            state.commentsParsed = true
        else
            user_opts.showyoutubecomments = false -- prevent crash when viewing comments
        end
        if state.showingDescription then
            show_description(state.localDescriptionClick)
        end
        msg.info("WEB: Read and parsed comments")
    end )
end

function loadSetOfComments(startIndex) 
    if (state.jsoncomments < 1) then
        return
    end

    state.commentDescription = ""
    for i=startIndex, #state.jsoncomments do
        if i > startIndex + (commentsperpage - 1) then
            state.currentCommentIndex = i
            break
        end

        local comment = state.jsoncomments[i]
        local commentconstruction = comment.author

        local linebreak = ''
        if (i ~= startIndex) then
            linebreak = '\\N'
        end
        if (comment.parent ~= "root") then
            commentconstruction = linebreak .. "\\N | " .. commentconstruction  .. " (Replying) | "
        else
            if (linebreak == '\\N') then
                commentconstruction = linebreak .. '-----\\N' .. commentconstruction .. ' | '
            else
                commentconstruction = '\\N' .. commentconstruction .. ' | '
            end
        end

        if (comment._time_text) then
            commentconstruction = commentconstruction .. comment._time_text
        end
        if (comment.is_favorited) then
            commentconstruction = commentconstruction .. (comment.is_favorited and ' | Favorited ♡\\N')
        end
        if (comment.is_pinned) then
            commentconstruction = commentconstruction .. (comment.is_pinned and ' | Pinned 📌\\N')
        else
            commentconstruction = commentconstruction .. '\\N'
        end

        local replyPad = ""
        if (comment.parent ~= "root") then
            replyPad = " | "
            commentconstruction = commentconstruction .. replyPad .. comment.text:gsub('\n', '\\N' .. replyPad)
        else
            commentconstruction = commentconstruction .. comment.text
        end

        if (comment.like_count) then
            local likeText = " likes"
            if (comment.like_count == 1) then
                likeText = " like"
            end
            commentconstruction = commentconstruction .. '\\N' .. replyPad .. comment.like_count .. likeText
        else
            commentconstruction = commentconstruction ..  '\\N' .. replyPad ..  "0 likes"
        end
        -- print(commentconstruction)
        state.youtubecomments[i] = commentconstruction
        state.commentDescription = state.commentDescription .. commentconstruction
    end
end

function exec(args, callback)
    msg.info("WEB: Running: " .. table.concat(args, " "))
    local ret = mp.command_native_async({
        name = "subprocess",
        args = args,
        capture_stdout = true,
        capture_stderr = true
    }, callback)
    return ret.status
end

function downloadDone(success, result, error)
    if success then
        show_message("\\N{\\an9}Download saved to " .. mp.command_native({"expand-path", user_opts.downloadpath}))
        state.downloadedOnce = true
        msg.info("WEB: Download complete")
    else
        show_message("\\N{\\an9}WEB: Download failed - " .. (error or "Unknown error"))
        msg.info("WEB: Download failed")
    end
    state.downloading = false
end

function splitUTF8(str, maxLength)
    local result = {}
    local currentIndex = 1
    local length = #str
    local lastchar = 0
    while currentIndex <= length do
        lastchar = lastchar + 1
        local byte = string.byte(str, currentIndex)
        local charLength
        if byte >= 0 and byte <= 127 then
            charLength = 1
        elseif byte >= 192 and byte <= 223 then
            charLength = 2
        elseif byte >= 224 and byte <= 239 then
            charLength = 3 
            -- CJK
        elseif byte >= 240 and byte <= 247 then
            charLength = 4
        else
            -- Unsupported UTF-8 sequence, handle as needed
            print("Unsupported UTF-8 sequence detected.")
            break
        end
        local currentPart = string.sub(str, currentIndex, currentIndex + charLength - 1)
        if #result > 0 and #result[#result] + #currentPart <= maxLength then
            result[#result] = result[#result] .. currentPart
        else
            result[#result + 1] = currentPart
        end
        currentIndex = currentIndex + charLength
        if #result > 0 and #result[#result] >= maxLength then
            break
        end
    end
    return result[1], lastchar
end

function exec_description(args, result)
    local ret = mp.command_native_async({
        name = "subprocess",
        args = args,
        capture_stdout = true,
        capture_stderr = true,
    }, function(res, val, err)
        if (state.dateexists) then 
            state.descriptionLoaded = true 
            msg.info("WEB: Loaded video description early")
            return 
        end

        state.localDescriptionClick = mp.get_property("media-title", "") .. string.gsub(string.gsub(val.stdout, '\r', '\\N') .. state.dislikes, '\n', '\\N')
        if (state.dislikes == "") then
            state.localDescriptionClick = mp.get_property("media-title", "") .. string.gsub(string.gsub(val.stdout, '\r', '\\N'), '\n', '\\N')
            state.localDescriptionClick = state.localDescriptionClick:sub(1, #state.localDescriptionClick - 2)
        end
        addLikeCountToTitle()

        -- check if description exists, if it doesn't get rid of the extra "----------"
        local descriptionText = state.localDescriptionClick:match("\\N----------\\N(.-)\\N----------\\N")
        state.ytdescription = state.ytdescription:gsub('\r', '\\N'):gsub('\n', '\\N'):gsub("%%", "%%%%")
        state.localDescriptionClick = state.localDescriptionClick:gsub("<$\\N!desc!\\N$>", state.ytdescription)
        if (state.ytdescription == '' or state.ytdescription == '\\N' or state.ytdescription == 'NA' or #state.ytdescription < 4) then
            state.localDescriptionClick = state.localDescriptionClick:gsub("(.*)\\N----------\\N", "%1")
        end
        if state.youtubeuploader then
            state.localDescriptionClick = state.localDescriptionClick:gsub("Uploader: <$\\N!uploader!\\N$>", "Uploader: " .. state.youtubeuploader)
        else
            state.localDescriptionClick = state.localDescriptionClick:gsub("Uploader: <$\\N!uploader!\\N$>", "Uploader: ")
        end

        if (state.localDescriptionClick:match('Views: (%d+)')) then
            state.localDescriptionClick = state.localDescriptionClick:gsub(state.localDescriptionClick:match('Views: (%d+)'), commas(state.localDescriptionClick:match('Views: (%d+)')))
        end
        if (state.localDescriptionClick:match('Likes: (%d+)')) then
            state.localDescriptionClick = state.localDescriptionClick:gsub(state.localDescriptionClick:match('Likes: (%d+)'), commas(state.localDescriptionClick:match('Likes: (%d+)')))
        end
        if (state.localDescriptionClick:match('Comments: (%d+)')) then
            state.localDescriptionClick = state.localDescriptionClick:gsub(state.localDescriptionClick:match('Comments: (%d+)'), commas(state.localDescriptionClick:match('Comments: (%d+)')))
        end

        state.localDescriptionClick = state.localDescriptionClick:gsub("Uploader: NA\\N", "")
        state.localDescriptionClick = state.localDescriptionClick:gsub("Uploaded: NA\\N", "")
        state.localDescriptionClick = state.localDescriptionClick:gsub("Views: NA\\N", "")
        state.localDescriptionClick = state.localDescriptionClick:gsub("Comments: NA\\N", "")
        state.localDescriptionClick = state.localDescriptionClick:gsub("Likes: NA\\N", "")
        state.localDescriptionClick = state.localDescriptionClick:gsub("Likes: NA", "")
        state.localDescriptionClick = state.localDescriptionClick:gsub("Dislikes: NA\\N", "")
        -- state.localDescriptionClick = state.localDescriptionClick:gsub("NA", "")

        local utf8split, lastchar = splitUTF8(state.ytdescription, maxdescsize) -- account for CJK
        
        -- segment localDescriptionClick parts with " | "
        local tempDesc

        local beforeLastPattern, afterLastPattern = state.localDescriptionClick:match("(.*)\\N----------\\N(.*)")
        if beforeLastPattern then
            local desc = string.match(beforeLastPattern, "\\N----------\\N(.*)")

            if desc then
                if utf8split then
                    if #utf8split == #desc then
                        desc = utf8split
                    else
                        desc = utf8split .. '...'
                    end
                else
                    if #desc > maxdescsize then
                        desc = desc:sub(1, maxdescsize) .. '...'
                    else
                        desc = desc:sub(1, maxdescsize)
                    end
                end

                afterLastPattern = afterLastPattern:gsub("Views:", emoticon.view):gsub("Comments:", emoticon.comment):gsub("Likes:", emoticon.like):gsub("Dislikes:", emoticon.dislike)  -- replace with icons
                tempDesc = desc  .. "\\N----------\\N" .. afterLastPattern:gsub("\\N", " | ")            
                tempDesc = tempDesc:gsub("\\N----------\\N", " | ")
            else
                tempDesc = afterLastPattern:gsub("\\N", " | ")
            end
        end
        
        if afterLastPattern then
            if (select(2, afterLastPattern:gsub("\\N", "")) == 1) then -- get rid of last | if there's only one item
                print("Erasing last item")
                tempDesc = tempDesc:gsub(" | ", "")
            end
        end

        state.descriptionLoaded = true
        if state.showingDescription then
            show_description(state.localDescriptionClick)
        end
        msg.info("WEB: Loaded video description")
    end)
end

function exec_dislikes(args, result)
    local ret = mp.command_native_async({
        name = "subprocess",
        args = args,
        capture_stdout = true,
        capture_stderr = true
    }, function(res, val, err)
        local dislikes = val.stdout
        dislikes = commas(dislikes:match('"dislikes":(%d+)'))
        state.dislikecount = dislikes

        if dislikes then
            state.dislikes = "Dislikes: " .. dislikes
            msg.info("WEB: Fetched dislike count")
        else
            state.dislikes = ""
        end

        if (not state.descriptionLoaded) then
            if state.localDescriptionClick then
                state.localDescriptionClick = state.localDescriptionClick .. '\\N' .. state.dislikes
            else
                state.localDescriptionClick = state.dislikes
            end
            state.videoDescription = state.localDescriptionClick
        else
            addLikeCountToTitle()
        end
    end)
end

function commas(number)
    if number == nil then return '' end

    return tostring(number) -- Make sure the "number" is a string
       :reverse() -- Reverse the string
       :gsub('%d%d%d', '%0,') -- insert one comma after every 3 numbers
       :gsub(',$', '') -- Remove a trailing comma if present
       :reverse() -- Reverse the string again
       :sub(1) -- a little hack to get rid of the second return value 😜
 end

function addLikeCountToTitle()
    if (user_opts.showdescription and user_opts.updatetitleyoutubestats) then
        state.viewcount = commas(state.localDescriptionClick:match('Views: (%d+)')) 
        state.likecount = commas(state.localDescriptionClick:match('Likes: (%d+)'))
        if (state.viewcount ~= '' and state.likecount ~= '' and state.dislikecount) then
            mp.set_property("title", mp.get_property("media-title") .. 
            " | " .. emoticon.view .. state.viewcount .. 
            " | " .. emoticon.like .. state.likecount .. 
            " | " .. emoticon.dislike .. state.dislikecount)
        elseif (state.viewcount ~= '' and state.likecount ~= '') then
            mp.set_property("title", mp.get_property("media-title") .. 
            " | " .. emoticon.view .. state.viewcount .. 
            " | " .. emoticon.like .. state.likecount)
        end    
    end
end

function format_file_size(file_size)
    local units = {"bytes", "KB", "MB", "GB", "TB"}
    local unit_index = 1
    while file_size >= 1024 and unit_index < #units do
        file_size = file_size / 1024
        unit_index = unit_index + 1
    end
    return string.format("%.1f %s", math.ceil(file_size), units[unit_index])
end

function exec_filesize(args, result)
    local ret = mp.command_native_async({
        name = "subprocess",
        args = args,
        capture_stdout = true,
        capture_stderr = true
    }, function(res, val, err)
        local fileSizeString = val.stdout
        state.fileSizeBytes = tonumber(fileSizeString)
        if type(state.fileSizeBytes) ~= "number" then
            state.fileSizeNormalised = "Unknown..."
            -- state.videoCantBeDownloaded = true
        else
            state.fileSizeNormalised = "Download size: " .. format_file_size(state.fileSizeBytes)
            msg.info("WEB: File size: " .. state.fileSizeBytes .. " B / " .. state.fileSizeNormalised)
        end
        request_tick()
    end)
end

-- playlist and chapters --
function get_playlist()
    local pos = mp.get_property_number('playlist-pos', 0) + 1
    local count, limlist = limited_list('playlist', pos)
    if count == 0 then
        return texts.nolist
    end

    local message = string.format(texts.playlist .. ' [%d/%d]:\n', pos, count)
    for i, v in ipairs(limlist) do
        local title = v.title
        local _, filename = utils.split_path(v.filename)
        if title == nil then
            title = filename
        end
        message = string.format('%s %s %s\n', message,
            (v.current and '●' or '○'), title)
    end
    return message
end

function get_chapterlist()
    local pos = mp.get_property_number('chapter', 0) + 1
    local count, limlist = limited_list('chapter-list', pos)
    if count == 0 then
        return texts.nochapter
    end

    local message = string.format(texts.chapter.. ' [%d/%d]:\n', pos, count)
    for i, v in ipairs(limlist) do
        local time = mp.format_time(v.time)
        local title = v.title
        if title == nil then
            title = string.format(texts.chapter .. ' %02d', i)
        end
        message = string.format('%s[%s] %s %s\n', message, time,
            (v.current and '●' or '○'), title)
    end
    return message
end

function show_message(text, duration)
    if state.showingDescription then
        destroyscrollingkeys()
    end
    if duration == nil then
        duration = tonumber(mp.get_property('options/osd-duration')) / 1000
    elseif not type(duration) == 'number' then
        print('duration: ' .. duration)
    end

    -- cut the text short, otherwise the following functions
    -- may slow down massively on huge input
    text = string.sub(text, 0, 4000)

    -- replace actual linebreaks with ASS linebreaks
    text = string.gsub(text, '\n', '\\N')

    state.message_text = text

    if not state.message_hide_timer then
        state.message_hide_timer = mp.add_timeout(0, request_tick)
    end
    state.message_hide_timer:kill()
    state.message_hide_timer.timeout = duration
    state.message_hide_timer:resume()
    request_tick()
end

function bind_keys(keys, name, func, opts)
    if not keys then
        mp.add_forced_key_binding(keys, name, func, opts)
        return
    end
    local i = 1
    for key in keys:gmatch("[^%s]+") do
        local prefix = i == 1 and '' or i
        mp.add_forced_key_binding(key, name .. prefix, func, opts)
        i = i + 1
    end
end

function unbind_keys(keys, name)
    if not keys then
        mp.remove_key_binding(name)
        return
    end
    local i = 1
    for key in keys:gmatch("[^%s]+") do
        local prefix = i == 1 and '' or i
        mp.remove_key_binding(name .. prefix)
        i = i + 1
    end
end

function destroyscrollingkeys()
    state.showingDescription = false
    state.scrolledlines = 25
    show_message("",0.01) -- dirty way to clear text
    unbind_keys("UP WHEEL_UP", "move_up")
    unbind_keys("DOWN WHEEL_DOWN", "move_down")
    unbind_keys("ENTER MBTN_LEFT", "select")
    unbind_keys("ESC MBTN_RIGHT", "close")
    unbind_keys("LEFT", "comments_left")
    unbind_keys("RIGHT", "comments_right")
end

function checkDesc()
    if state.descriptionLoaded or state.localDescriptionIsClickable then
        if state.showingDescription then
            state.showingDescription = false
            destroyscrollingkeys()
        else
            state.showingDescription = true
            if (state.isWebVideo) then
                show_description(state.localDescriptionClick)
            else
                if (state.localDescriptionClick == nil) then
                    show_description(state.localDescription)
                else
                    show_description(state.localDescriptionClick)
                end
            end
        end
    end
end

function show_description(text)
    duration = 10
    if (state.isWebVideo and user_opts.showyoutubecomments) then
        if (state.commentsParsed and user_opts.showyoutubecomments) then
            state.commentsAdditionalText = '\\N----------\\NPress LEFT/RIGHT to view comments\\N' .. state.maxCommentPages .. ' pages (' .. #state.jsoncomments .. ' comments)'
            text = text .. state.commentsAdditionalText
        else
            text = text .. '\\N----------\\NComments loading...'
        end
    end
    text = string.gsub(text, '\n', '\\N')

    -- enable scrolling of menu --
    bind_keys("UP WHEEL_UP", "move_up", function() 
        state.scrolledlines = state.scrolledlines + user_opts.scrollingSpeed
        if (state.scrolledlines > 25) then 
            state.scrolledlines = 25 
        end
        resetDescTimer()
        request_tick()
    end, { repeatable = true })
    bind_keys("DOWN WHEEL_DOWN", "move_down", function() 
        state.scrolledlines = state.scrolledlines - user_opts.scrollingSpeed 
        resetDescTimer()
        request_tick()
    end, { repeatable = true })
    bind_keys("ENTER", "select", destroyscrollingkeys)
    bind_keys("ESC", "close", function()
        if (state.commentsPage > 0) then
            state.commentsPage = 0
            state.message_text = state.localDescriptionClick .. state.commentsAdditionalText
            resetDescTimer()
            request_tick()
        else
            destroyscrollingkeys()
        end
    end) -- close menu using ESC
    
    state.commentsPage = 0
    if (state.isWebVideo and user_opts.showyoutubecomments) then
        bind_keys("LEFT", "comments_left", function() 
            if (state.commentsParsed) then
                state.commentsPage = state.commentsPage - 1
                if (state.commentsPage == 0) then
                    state.message_text = state.localDescriptionClick .. state.commentsAdditionalText
                elseif (state.commentsPage > 0) then
                    loadSetOfComments((state.commentsPage - 1) * commentsperpage + 1)
                    state.message_text = 'Comments | Page ' .. state.commentsPage .. '/' .. state.maxCommentPages .. ' (' .. (state.commentsPage - 1) * commentsperpage + 1 .. '/' .. #state.jsoncomments .. ')\\N----------' .. state.commentDescription:gsub('\n', '\\N')
                else
                    state.commentsPage = state.maxCommentPages
                    loadSetOfComments((state.commentsPage - 1) * commentsperpage + 1)
                    state.message_text = 'Comments | Page ' .. state.commentsPage .. '/' .. state.maxCommentPages .. ' (' .. (state.commentsPage - 1) * commentsperpage + 1 .. '/' .. #state.jsoncomments .. ')\\N----------' .. state.commentDescription:gsub('\n', '\\N')
                end
                state.scrolledlines = 25
            end
            resetDescTimer()
            request_tick()
        end)
        bind_keys("RIGHT", "comments_right", function() 
            if (state.commentsParsed) then
                state.commentsPage = state.commentsPage + 1
                if (state.commentsPage > state.maxCommentPages) then
                    state.commentsPage = 0
                    state.message_text = state.localDescriptionClick .. state.commentsAdditionalText
                else
                    loadSetOfComments((state.commentsPage - 1) * commentsperpage + 1)
                    state.message_text = 'Comments | Page ' .. state.commentsPage .. '/' .. state.maxCommentPages .. ' (' .. (state.commentsPage - 1) * commentsperpage + 1 .. '/' .. #state.jsoncomments .. ')\\N----------' .. state.commentDescription:gsub('\n', '\\N')    
                end
                state.scrolledlines = 25
            end
            resetDescTimer()
            request_tick()
        end)
    end

    state.message_text = text

    if not state.message_hide_timer then
        state.message_hide_timer = mp.add_timeout(0, request_tick)
    end
    resetDescTimer()
    request_tick()
end

function resetDescTimer()
    state.message_hide_timer:kill()
    state.message_hide_timer.timeout = duration
    state.message_hide_timer:resume()
end

function render_message(ass)
    if state.message_hide_timer and state.message_hide_timer:is_enabled() and state.message_text then
        local _, lines = string.gsub(state.message_text, '\\N', '')

        local fontsize = tonumber(mp.get_property('options/osd-font-size'))
        local outline = tonumber(mp.get_property('options/osd-border-size'))
        local maxlines = math.ceil(osc_param.unscaled_y*0.75 / fontsize)
        local counterscale = osc_param.playresy / osc_param.unscaled_y

        if state.showingDescription then
            fontsize = fontsize * 0.85
            outline = outline * 0.85
        else
            fontsize = fontsize * counterscale / math.max(0.5 + math.min(lines/maxlines, 1), 1)
            outline = outline * counterscale / math.max(0.5 + math.min(lines/maxlines, 1)/2, 1)    
        end

        if state.showingDescription then
            ass.text = string.format('{\\pos(0,0)\\an7\\1c&H000000&\\alpha&H%X&}', user_opts.descriptionBoxAlpha)
            ass:draw_start()
            ass:rect_cw(0, 0, osc_param.playresx, osc_param.playresy)
            ass:draw_stop()
            ass:new_event()
        end

        local style = '{\\bord' .. outline .. '\\fs' .. fontsize .. '}'

        ass:new_event()
        ass:append(style .. state.message_text)

        if state.showingDescription then
            ass:pos(20, state.scrolledlines)
            local alpha = 10
        end
    else
        state.message_text = nil
        if state.showingDescription then destroyscrollingkeys() end
    end
end

--
-- Initialisation and Layout
--

function new_element(name, type)
    elements[name] = {}
    elements[name].type = type
    elements[name].name = name

    -- add default stuff
    elements[name].eventresponder = {}
    elements[name].visible = true
    elements[name].enabled = true
    elements[name].softrepeat = false
    elements[name].styledown = (type == 'button')
    elements[name].state = {}

    if (type == 'slider') then
        elements[name].slider = {min = {value = 0}, max = {value = 100}}
        elements[name].thumbnailable = false
    end


    return elements[name]
end

function add_layout(name)
    if not (elements[name] == nil) then
        -- new layout
        elements[name].layout = {}

        -- set layout defaults
        elements[name].layout.layer = 50
        elements[name].layout.alpha = {[1] = 0, [2] = 255, [3] = 255, [4] = 255}

        if (elements[name].type == 'button') then
            elements[name].layout.button = {
                maxchars = nil,
                hoverstyle = osc_styles.elementHover,
            }
        elseif (elements[name].type == 'slider') then
            -- slider defaults
            elements[name].layout.slider = {
                border = 1,
                gap = 1,
                nibbles_top = true,
                nibbles_bottom = true,
                adjust_tooltip = true,
                tooltip_style = '',
                tooltip_an = 2,
                alpha = {[1] = 0, [2] = 255, [3] = 88, [4] = 255},
            }
        elseif (elements[name].type == 'box') then
            elements[name].layout.box = {radius = 0, hexagon = false}
        end

        return elements[name].layout
    else
        msg.error('Can\'t add_layout to element \''..name..'\', doesn\'t exist.')
    end
end

-- Window Controls
function window_controls()
    local wc_geo = {
        x = 0,
        y = 30,
        an = 1,
        w = osc_param.playresx,
        h = 30
    }

    local controlbox_w = window_control_box_width
    local titlebox_w = wc_geo.w - controlbox_w

    -- Default alignment is 'right'
    local controlbox_left = wc_geo.w - controlbox_w
    local titlebox_left = wc_geo.x
    local titlebox_right = wc_geo.w - controlbox_w

    add_area('window-controls',
             get_hitbox_coords(controlbox_left, wc_geo.y, wc_geo.an,
                               controlbox_w, wc_geo.h))

    local lo

    -- Background Bar
    if user_opts.titleBarStrip then
        new_element("wcbar", "box")
        lo = add_layout("wcbar")
        lo.geometry = wc_geo
        lo.layer = 10
        lo.style = osc_styles.wcBar
        lo.alpha[1] = user_opts.boxalpha
    end

    local button_y = wc_geo.y - (wc_geo.h / 2)
    local first_geo =
        {x = controlbox_left + 30, y = button_y, an = 5, w = 40, h = wc_geo.h}
    local second_geo =
        {x = controlbox_left + 74, y = button_y, an = 5, w = 40, h = wc_geo.h}
    local third_geo =
        {x = controlbox_left + 118, y = button_y, an = 5, w = 40, h = wc_geo.h}

    -- Window control buttons use symbols in the custom mpv osd font
    -- because the official unicode codepoints are sufficiently
    -- exotic that a system might lack an installed font with them,
    -- and libass will complain that they are not present in the
    -- default font, even if another font with them is available.

    -- Window Title
    if user_opts.showwindowtitle then
        ne = new_element("windowtitle", "button")
        ne.content = function ()
            local title = mp.command_native({"expand-text", mp.get_property('title')})
            -- escape ASS, and strip newlines and trailing slashes
            title = title:gsub("\\n", " "):gsub("\\$", ""):gsub("{","\\{")
            local titleval = not (title == "") and title or "mpv video"
            if (mp.get_property('ontop') == 'yes') then return "📌 " .. titleval end
            return titleval
        end
        lo = add_layout('windowtitle')
        geo = {x = 10, y = button_y + 10, an = 1, w = osc_param.playresx - 50, h = wc_geo.h}
        lo.geometry = geo
        lo.style = osc_styles.WindowTitle
        lo.button.maxchars = geo.w / 10
    end

    -- Close: 🗙
    ne = new_element('close', 'button')
    ne.content = '\238\132\149'
    ne.eventresponder['mbtn_left_up'] =
        function () mp.commandv('quit') end
    lo = add_layout('close')
    lo.geometry = third_geo
    lo.style = osc_styles.WinCtrl
    lo.button.hoverstyle = "{\\c&H2311E8&}"

    -- Minimize: 🗕
    ne = new_element('minimize', 'button')
    ne.content = '\238\132\146'
    ne.eventresponder['mbtn_left_up'] =
        function () mp.commandv('cycle', 'window-minimized') end
    lo = add_layout('minimize')
    lo.geometry = first_geo
    lo.style = osc_styles.WinCtrl
    
    -- Maximize: 🗖/🗗
    ne = new_element('maximize', 'button')
    if state.maximized or state.fullscreen then
        ne.content = '\238\132\148'
    else
        ne.content = '\238\132\147'
    end
    ne.eventresponder['mbtn_left_up'] =
        function ()
            if state.fullscreen then
                mp.commandv('cycle', 'fullscreen')
            else
                mp.commandv('cycle', 'window-maximized')
            end
        end
    lo = add_layout('maximize')
    lo.geometry = second_geo
    lo.style = osc_styles.WinCtrl
end

--
-- ModernX Layout
--

local layouts = {}

-- Default layout
layouts = function ()
    local osc_geo = {
        w = osc_param.playresx,
        h = 180
    }

    -- origin of the controllers, left/bottom corner
    local posX = 0
    local posY = osc_param.playresy

    osc_param.areas = {} -- delete areas

    -- area for active mouse input
    add_area('input', get_hitbox_coords(posX, posY, 1, osc_geo.w, osc_geo.h))

    -- area for show/hide
    add_area('showhide', 0, 0, osc_param.playresx, osc_param.playresy)

    -- fetch values
    local osc_w, osc_h=
        osc_geo.w, osc_geo.h

    -- Controller Background
    local lo, geo
    
    new_element('TransBg', 'box')
    lo = add_layout('TransBg')
    lo.geometry = {x = posX, y = posY, an = 7, w = osc_w, h = 1}
    lo.style = osc_styles.TransBg
    lo.layer = 10
    lo.alpha[3] = 0

    if not user_opts.titleBarStrip and not state.border then
        new_element('TitleTransBg', 'box')
        lo = add_layout('TitleTransBg')
        lo.geometry = {x = posX, y = -100, an = 7, w = osc_w, h = -1}
        lo.style = osc_styles.TransBg
        lo.layer = 10
        lo.alpha[3] = 0
    end
        
    -- Alignment
    local refX = osc_w / 2
    local refY = posY
        
    -- Seekbar
    new_element('seekbarbg', 'box')
    lo = add_layout('seekbarbg')
    lo.geometry = {x = refX , y = refY - 100, an = 5, w = osc_geo.w - 50, h = 2}
    lo.layer = 13
    lo.style = osc_styles.SeekbarBg
    lo.alpha[1] = 128
    lo.alpha[3] = 128

    lo = add_layout('seekbar')
    lo.geometry = {x = refX, y = refY - 100, an = 5, w = osc_geo.w - 50, h = 16}
    lo.style = osc_styles.SeekbarFg
    lo.slider.gap = 7
    lo.slider.tooltip_style = osc_styles.Tooltip
    lo.slider.tooltip_an = 2
    
    if (user_opts.persistentprogress or user_opts.persistentprogresstoggle) then
        lo = add_layout('persistentseekbar')
        lo.geometry = {x = refX, y = refY, an = 5, w = osc_geo.w, h = user_opts.persistentprogressheight}
        lo.style = osc_styles.SeekbarFg
        lo.slider.gap = 7
        lo.slider.tooltip_an = 0   
    end

    local showjump = user_opts.showjump
    local showskip = user_opts.showskip
    local showloop = user_opts.showloop
    local showinfo = user_opts.showinfo
    local showontop = user_opts.showontop
    local showscreenshot = user_opts.screenshotbutton

    if user_opts.compactmode then
        user_opts.showjump = false
        showjump = false
    end
    local offset = showjump and 60 or 0
    local outeroffset = (showskip and 0 or 100) + (showjump and 0 or 100)

    -- Title
    geo = {x = 25, y = refY - 122 + (((state.localDescription ~= nil or state.isWebVideo) and user_opts.showdescription) and -20 or 0), an = 1, w = osc_geo.w - 50, h = 35}
    lo = add_layout("title")
    lo.geometry = geo
    lo.style = string.format("%s{\\clip(0,%f,%f,%f)}", osc_styles.Title,
                             geo.y - geo.h, geo.x + geo.w, geo.y + geo.h)
    lo.alpha[3] = 0
    lo.button.maxchars = geo.w / 11

    -- Description
    if (state.localDescription ~= nil or state.isWebVideo) and user_opts.showdescription then
        geo = {x = 25, y = refY - 122, an = 1, w = osc_geo.w - 80, h = 19}
        lo = add_layout("description")
        lo.geometry = geo
        lo.style = osc_styles.Description
        lo.alpha[3] = 0
        lo.button.maxchars = geo.w / 7
    end

    -- Volumebar
    lo = new_element('volumebarbg', 'box')
    lo.visible = (osc_param.playresx >= 900 - outeroffset) and user_opts.volumecontrol
    lo = add_layout('volumebarbg')
    lo.geometry = {x = 155, y = refY - 40, an = 4, w = 80, h = 2}
    lo.layer = 13
    lo.alpha[1] = 128
    lo.style = osc_styles.VolumebarBg
    
    lo = add_layout('volumebar')
    lo.geometry = {x = 155, y = refY - 40, an = 4, w = 80, h = 8}
    lo.style = osc_styles.VolumebarFg
    lo.slider.gap = 3
    lo.slider.tooltip_style = osc_styles.Tooltip
    lo.slider.tooltip_an = 2

    -- buttons
    lo = add_layout('pl_prev')
    if showskip then
        lo.geometry = {x = refX - 120 - offset, y = refY - 40 , an = 5, w = 30, h = 24}
    else
        lo.geometry = {x = refX - 60 - offset, y = refY - 40 , an = 5, w = 30, h = 24}
    end
    lo.style = osc_styles.Ctrl2

    if showskip then 
        lo = add_layout('skipback')
        lo.geometry = {x = refX - 60 - offset, y = refY - 40 , an = 5, w = 30, h = 24}
        lo.style = osc_styles.Ctrl2
    end

    if showjump then
        lo = add_layout('jumpback')
        lo.geometry = {x = refX - 60, y = refY - 40 , an = 5, w = 30, h = 24}
        lo.style = osc_styles.Ctrl2
    end

    lo = add_layout('playpause')
    lo.geometry = {x = refX, y = refY - 40 , an = 5, w = 45, h = 45}
    lo.style = osc_styles.Ctrl1

    if showjump then
        lo = add_layout('jumpfrwd')
        lo.geometry = {x = refX + 60, y = refY - 40 , an = 5, w = 30, h = 24}
        -- HACK: jumpfrwd's icon must be mirrored for nonstandard # of seconds
        -- as the font only has an icon without a number for rewinding
        lo.style = (user_opts.jumpiconnumber and jumpicons[user_opts.jumpamount] ~= nil) and osc_styles.Ctrl2 or osc_styles.Ctrl2Flip
    end

    if showskip then
        lo = add_layout('skipfrwd')
        lo.geometry = {x = refX + 60 + offset, y = refY - 40 , an = 5, w = 30, h = 24}
        lo.style = osc_styles.Ctrl2
    end

    lo = add_layout('pl_next')
    if showskip then
        lo.geometry = {x = refX + 120 + offset, y = refY - 40 , an = 5, w = 30, h = 24}
    else
        lo.geometry = {x = refX + 60 + offset, y = refY - 40 , an = 5, w = 30, h = 24}
    end
    lo.style = osc_styles.Ctrl2

    -- Time
    lo = add_layout('tc_left')
    lo.geometry = {x = 25, y = refY - 84, an = 7, w = 100, h = 20}
    lo.style = osc_styles.Time
        
    lo = add_layout('tc_right')
    lo.geometry = {x = osc_geo.w - 25 , y = refY -84, an = 9, w = 100, h = 20}
    lo.style = osc_styles.Time

    -- Audio/Subtitle
    lo = add_layout('cy_audio')
    lo.geometry = {x = 37, y = refY - 40, an = 5, w = 24, h = 24}
    lo.style = osc_styles.Ctrl3
    lo.visible = (osc_param.playresx >= 500 - outeroffset)

    lo = add_layout('cy_sub')
    lo.geometry = {x = 82, y = refY - 40, an = 5, w = 24, h = 24}
    lo.style = osc_styles.Ctrl3
    lo.visible = (osc_param.playresx >= 600 - outeroffset)

    lo = add_layout('vol_ctrl')
    lo.geometry = {x = 127, y = refY - 40, an = 5, w = 24, h = 24}
    lo.style = osc_styles.Ctrl3
    lo.visible = (osc_param.playresx >= 700 - outeroffset)

    -- Fullscreen/Loop/Info
    lo = add_layout('tog_fs')
    lo.geometry = {x = osc_geo.w - 37, y = refY - 40, an = 5, w = 24, h = 24}
    lo.style = osc_styles.Ctrl3
    lo.visible = (osc_param.playresx >= 250 - outeroffset)    

    if showontop then
        lo = add_layout('tog_ontop')
        lo.geometry = {x = osc_geo.w - 127 + (showloop and 0 or 45), y = refY - 40, an = 5, w = 24, h = 24}
        lo.style = osc_styles.Ctrl3
        lo.visible = (osc_param.playresx >= 700 - outeroffset)
    end

    if showloop then
        lo = add_layout('tog_loop')
        lo.geometry = {x = osc_geo.w - 82, y = refY - 40, an = 5, w = 24, h = 24}
        lo.style = osc_styles.Ctrl3
        lo.visible = (osc_param.playresx >= 600 - outeroffset)    
    end

    if showinfo then
        lo = add_layout('tog_info')
        lo.geometry = {x = osc_geo.w - 172 + (showloop and 0 or 45) + (showontop and 0 or 45), y = refY - 40, an = 5, w = 24, h = 24}
        lo.style = osc_styles.Ctrl3
        lo.visible = (osc_param.playresx >= 500 - outeroffset)
    end

    if showscreenshot then
        lo = add_layout('screenshot')
        lo.geometry = {x = osc_geo.w - 217 + (showloop and 0 or 45) + (showontop and 0 or 45) + (showinfo and 0 or 45), y = refY - 40, an = 5, w = 24, h = 24}
        lo.style = osc_styles.Ctrl3
        lo.visible = (osc_param.playresx >= 300 - outeroffset)
    end

    if user_opts.downloadbutton then
        lo = add_layout('download')
        lo.geometry = {x = osc_geo.w - 262 + (showloop and 0 or 45) + (showontop and 0 or 45) + (showinfo and 0 or 45) + (showscreenshot and 0 or 45), y = refY - 40, an = 5, w = 24, h = 24}
        lo.style = osc_styles.Ctrl3
        lo.visible = (osc_param.playresx >= 400 - outeroffset)
    end
end

-- Validate string type user options
function validate_user_opts()
    if user_opts.windowcontrols ~= 'auto' and
       user_opts.windowcontrols ~= 'yes' and
       user_opts.windowcontrols ~= 'no' then
        msg.warn('windowcontrols cannot be \'' ..
                user_opts.windowcontrols .. '\'. Ignoring.')
        user_opts.windowcontrols = 'auto'
    end

    if user_opts.volumecontroltype ~= "linear" and
       user_opts.volumecontroltype ~= "log" then
        msg.warn("volumecontrol cannot be \"" ..
                user_opts.volumecontroltype .. "\". Ignoring.")
        user_opts.volumecontroltype = "linear"
    end
end

function update_options(list)
    validate_user_opts()
    request_tick()
    visibility_mode("auto")
    request_init()
end

-- OSC INIT
function osc_init()
    msg.debug('osc_init')

    -- set canvas resolution according to display aspect and scaling setting
    local baseResY = 720
    local display_w, display_h, display_aspect = mp.get_osd_size()
    local scale = 1

    if (mp.get_property('video') == 'no') then -- dummy/forced window
        scale = user_opts.scaleforcedwindow
    elseif state.fullscreen then
        scale = user_opts.scalefullscreen
    else
        scale = user_opts.scalewindowed
    end

    if user_opts.vidscale then
        osc_param.unscaled_y = baseResY
    else
        osc_param.unscaled_y = display_h
    end
    osc_param.playresy = osc_param.unscaled_y / scale
    if (display_aspect > 0) then
        osc_param.display_aspect = display_aspect
    end
    osc_param.playresx = osc_param.playresy * osc_param.display_aspect

    -- stop seeking with the slider to prevent skipping files
    state.active_element = nil

    elements = {}

    -- some often needed stuff
    local pl_count = mp.get_property_number('playlist-count', 0)
    local have_pl = (pl_count > 1)
    local pl_pos = mp.get_property_number('playlist-pos', 0) + 1
    local have_ch = (mp.get_property_number('chapters', 0) > 0)
    local loop = mp.get_property('loop-playlist', 'no')

    local nojumpoffset = user_opts.showjump and 0 or 100
    local noskipoffset = user_opts.showskip and 0 or 100

    local compactmode = user_opts.compactmode

    if compactmode then nojumpoffset = 100 end

    local outeroffset = (user_opts.showskip and 0 or 140) + (user_opts.showjump and 0 or 140)
    if compactmode then outeroffset = 140 end

    local ne

    -- title
    ne = new_element('title', 'button')
    ne.visible = user_opts.showtitle
    ne.content = function ()
        local title = state.forced_title or
                      mp.command_native({"expand-text", user_opts.title})
        -- escape ASS, and strip newlines and trailing slashes
        title = title:gsub("\\n", " "):gsub("\\$", ""):gsub("{","\\{")
        return not (title == "") and title or "mpv video"
    end
    ne.eventresponder["mbtn_left_up"] = function ()
        local title = mp.get_property_osd("media-title")
        show_message(title)
    end
    ne.eventresponder["mbtn_right_up"] =
        function () show_message(mp.get_property_osd("filename")) end

    -- description
    ne = new_element('description', 'button')
    ne.visible = (state.localDescription ~= nil or state.isWebVideo) and user_opts.showdescription
    ne.content = function ()
        if state.isWebVideo then
            local title = "Loading description..."
            if (state.descriptionLoaded) then
                title = state.videoDescription:sub(1, 300)
            end
            -- get rid of new lines
            title = string.gsub(title, '\\N', ' ')
            return not (title == "") and title or "error"
        else
            return string.gsub(state.localDescription, '\\N', ' ')
        end
    end
    ne.eventresponder['mbtn_left_up'] =
        function ()
            checkDesc()
        end

    -- playlist buttons
    -- prev
    ne = new_element('pl_prev', 'button')
    ne.visible = (osc_param.playresx >= 500 - nojumpoffset - noskipoffset*(nojumpoffset == 0 and 1 or 10))
    ne.content = icons.previous
    ne.enabled = (pl_pos > 1) or (loop ~= 'no')
    ne.eventresponder['mbtn_left_up'] =
        function ()
            mp.commandv('playlist-prev', 'weak')
            destroyscrollingkeys()
        end
    ne.eventresponder['enter'] =
        function ()
            mp.commandv('playlist-prev', 'weak')
            destroyscrollingkeys()
            show_message(get_playlist()) 
        end
    ne.eventresponder['mbtn_right_up'] =
        function () show_message(get_playlist()) end
    ne.eventresponder['shift+mbtn_left_down'] =
        function () show_message(get_playlist()) end

    --next
    ne = new_element('pl_next', 'button')
    ne.visible = (osc_param.playresx >= 500 - nojumpoffset - noskipoffset*(nojumpoffset == 0 and 1 or 10))
    ne.content = icons.next
    ne.enabled = (have_pl and (pl_pos < pl_count)) or (loop ~= 'no')
    ne.eventresponder['mbtn_left_up'] =
        function () 
            mp.commandv('playlist-next', 'weak') 
            destroyscrollingkeys()
        end
    ne.eventresponder['enter'] =
        function () 
            mp.commandv('playlist-next', 'weak')
            destroyscrollingkeys()
            show_message(get_playlist())
        end
    ne.eventresponder['mbtn_right_up'] =
        function () show_message(get_playlist()) end
    ne.eventresponder['shift+mbtn_left_down'] =
        function () show_message(get_playlist()) end

    --play control buttons
    --playpause
    ne = new_element('playpause', 'button')

    ne.content = function ()
        if mp.get_property("eof-reached") == "yes" then
            return (icons.replay)
        elseif mp.get_property("pause") == "yes" and not state.playingWhilstSeeking then
            return (icons.play)
        else
            return (icons.pause)
        end

    end
    ne.eventresponder["mbtn_left_up"] =
        function ()
            if mp.get_property("eof-reached") == "yes" then
                mp.commandv("seek", 0, "absolute-percent")
                mp.commandv("set", "pause", "no")
            else
                mp.commandv("cycle", "pause")
            end
        end
    ne.eventresponder["mbtn_right_down"] =
        function ()
            if (state.looping) then
                show_message("Looping disabled")
            else
                show_message("Looping enabled")
            end    
            state.looping = not state.looping
            mp.set_property_native("loop-file", state.looping)
        end


    if user_opts.showjump then
        local jumpamount = user_opts.jumpamount
        local jumpmode = user_opts.jumpmode
        local icons = jumpicons.default
        if user_opts.jumpiconnumber then
            icons = jumpicons[jumpamount] or jumpicons.default
        end

        --jumpback
        ne = new_element('jumpback', 'button')

        ne.softrepeat = true
        ne.content = icons[1]
        ne.eventresponder['mbtn_left_down'] =
            function () mp.commandv('seek', -jumpamount, jumpmode) end
        ne.eventresponder['mbtn_right_down'] =
            function () mp.commandv('seek', -60, jumpmode) end
        ne.eventresponder['shift+mbtn_left_down'] =
            function () mp.commandv('frame-back-step') end


        --jumpfrwd
        ne = new_element('jumpfrwd', 'button')

        ne.softrepeat = true
        ne.content = icons[2]
        ne.eventresponder['mbtn_left_down'] =
            function () mp.commandv('seek', jumpamount, jumpmode) end
        ne.eventresponder['mbtn_right_down'] =
            function () mp.commandv('seek', 60, jumpmode) end
        ne.eventresponder['shift+mbtn_left_down'] =
            function () mp.commandv('frame-step') end
    end
    

    --skipback
    local jumpamount = user_opts.jumpamount
    local jumpmode = user_opts.jumpmode

    ne = new_element('skipback', 'button')
    ne.visible = (osc_param.playresx >= 400 - nojumpoffset*10)
    ne.softrepeat = true
    ne.content = icons.backward
    ne.enabled = (have_ch) or compactmode -- disables button when no chapters available.
    ne.eventresponder['mbtn_left_down'] =
        function () 
            if compactmode then
                mp.commandv('seek', -jumpamount, jumpmode)
            else
                mp.commandv("add", "chapter", -1)
            end
        end
    ne.eventresponder['mbtn_right_down'] =
        function () 
            if compactmode then     
                mp.commandv("add", "chapter", -1)
                show_message(get_chapterlist())
                show_message(get_chapterlist()) -- run twice as it might show the wrong chapter without another function
            else
                show_message(get_chapterlist())
            end
        end
    ne.eventresponder['shift+mbtn_left_down'] =
        function ()
            mp.commandv('seek', -60, jumpmode)
        end
    ne.eventresponder['shift+mbtn_right_down'] =
        function () show_message(get_chapterlist()) end


    --skipfrwd
    ne = new_element('skipfrwd', 'button')
    ne.visible = (osc_param.playresx >= 400 - nojumpoffset*10)
    ne.softrepeat = true
    ne.content = icons.forward
    ne.enabled = (have_ch) or compactmode -- disables button when no chapters available.
    ne.eventresponder['mbtn_left_down'] =
        function ()
            if compactmode then
                mp.commandv('seek', jumpamount, jumpmode)
            else
                mp.commandv("add", "chapter", 1)
            end
        end
    ne.eventresponder['mbtn_right_down'] =
        function ()
            if compactmode then
                mp.commandv("add", "chapter", 1)
                show_message(get_chapterlist())
                show_message(get_chapterlist()) -- run twice as it might show the wrong chapter without another function    
            else
                show_message(get_chapterlist())
            end
        end
    ne.eventresponder['shift+mbtn_left_down'] =
        function ()
            mp.commandv('seek', 60, jumpmode)
        end
    ne.eventresponder['shift+mbtn_right_down'] =
        function () show_message(get_chapterlist()) end

    --
    update_tracklist()
    
    --cy_audio
    ne = new_element('cy_audio', 'button')
    ne.enabled = (#tracks_osc.audio > 0)
    ne.off = (get_track('audio') == 0)
    ne.visible = (osc_param.playresx >= 500 - outeroffset)
    ne.content = icons.audio
    ne.tooltip_style = osc_styles.Tooltip
    ne.tooltipF = function ()
        local msg = texts.off
        if not (get_track('audio') == 0) then
            msg = (texts.audio .. ' [' .. get_track('audio') .. ' ∕ ' .. #tracks_osc.audio .. ']')
            local prop = mp.get_property('current-tracks/audio/title')
            if not prop then
                prop = mp.get_property('current-tracks/audio/lang')
                if not prop then
                    prop = texts.na
                else
                    msg = msg .. ' [' .. prop .. ']'
                end
            end
            return msg
        end
        if not ne.enabled then
            msg = "No audio tracks"
        end
        return msg
    end
    ne.nothingavailable = texts.noaudio
    ne.eventresponder['mbtn_left_up'] = 
    function () set_track('audio', 1) show_message(get_tracklist('audio')) end
    ne.eventresponder['enter'] = 
        function () 
            set_track('audio', 1) 
            show_message(get_tracklist('audio'))
        end
    ne.eventresponder['mbtn_right_up'] = 
        function () set_track('audio', -1) show_message(get_tracklist('audio')) end
    ne.eventresponder['shift+mbtn_left_down'] =
    function () set_track('audio', 1) show_message(get_tracklist('audio')) end
    ne.eventresponder['shift+mbtn_right_down'] =
        function () show_message(get_tracklist('audio')) end
                
    --cy_sub
    ne = new_element('cy_sub', 'button')
    ne.enabled = (#tracks_osc.sub > 0)
    ne.off = (get_track('sub') == 0)
    ne.visible = (osc_param.playresx >= 600 - outeroffset)
    ne.content = icons.sub
    ne.tooltip_style = osc_styles.Tooltip
    ne.tooltipF = function ()
        local msg = texts.off
        if not (get_track('sub') == 0) then
            msg = (texts.subtitle .. ' [' .. get_track('sub') .. ' ∕ ' .. #tracks_osc.sub .. ']')
            local prop = mp.get_property('current-tracks/sub/lang')
            if not prop then
                prop = texts.na
            else
                msg = msg .. ' [' .. prop .. ']'
            end
            prop = mp.get_property('current-tracks/sub/title')
            if prop then
                msg = msg .. ' ' .. prop
            end
            return msg
        end
        return msg
    end
    ne.nothingavailable = texts.nosub
    ne.eventresponder['mbtn_left_up'] = 
        function () set_track('sub', 1) show_message(get_tracklist('sub')) end
    ne.eventresponder['enter'] = 
        function ()
            set_track('sub', 1)
            show_message(get_tracklist('sub'))
        end
    ne.eventresponder['mbtn_right_up'] =
        function () set_track('sub', -1) show_message(get_tracklist('sub')) end
    ne.eventresponder['shift+mbtn_left_down'] =
    function () set_track('sub', 1) show_message(get_tracklist('sub')) end
    ne.eventresponder['shift+mbtn_right_down'] =
        function () show_message(get_tracklist('sub')) end
    
    -- vol_ctrl
    ne = new_element('vol_ctrl', 'button')
    ne.enabled = (get_track('audio')>0)
    ne.visible = (osc_param.playresx >= 700 - outeroffset) and user_opts.volumecontrol
    ne.content = function ()
        local volume = mp.get_property_number("volume", 0)
        if state.mute then
            return icons.volumemute
        else
            if volume > 85 then
                return icons.volume
            else
                return icons.volumelow
            end
        end
    end
    ne.eventresponder['mbtn_left_up'] =
        function () 
            mp.commandv('cycle', 'mute')
        end
    ne.eventresponder["wheel_up_press"] =
        function () 
            if (state.mute) then mp.commandv('cycle', 'mute') end
            mp.commandv("osd-auto", "add", "volume", 5)
        end
    ne.eventresponder["wheel_down_press"] =
        function () 
            if (state.mute) then mp.commandv('cycle', 'mute') end
            mp.commandv("osd-auto", "add", "volume", -5)
        end
    
    --tog_fs
    ne = new_element('tog_fs', 'button')
    ne.content = function ()
        if (state.fullscreen) then
            return (icons.minimize)
        else
            return (icons.fullscreen)
        end
    end
    ne.visible = (osc_param.playresx >= 250)
    ne.eventresponder['mbtn_left_up'] =
        function () mp.commandv('cycle', 'fullscreen') end

    --tog_loop
    ne = new_element('tog_loop', 'button')
    ne.content = function ()
        if (state.looping) then
            return (icons.loopon)
        else
            return (icons.loopoff)
        end
    end
    ne.visible = (osc_param.playresx >= 600 - outeroffset)
    ne.tooltip_style = osc_styles.Tooltip
    ne.tooltipF = function ()
        local msg = texts.loopenable
        if state.looping then
            msg = texts.loopdisable
        end
        return msg
    end
    ne.eventresponder['mbtn_left_up'] =
        function ()
            state.looping = not state.looping
            mp.set_property_native("loop-file", state.looping)
        end    

    --download
    ne = new_element('download', 'button')
    ne.content = function ()
        if (state.downloading) then
            return (icons.downloading)
        else
            return (icons.download)
        end
    end
    ne.visible = (osc_param.playresx >= 1100 - outeroffset - (user_opts.showloop and 0 or 100) - (user_opts.showontop and 0 or 100) - (user_opts.showinfo and 0 or 100) - (user_opts.showscreenshot and 0 or 100)) and state.isWebVideo
    ne.tooltip_style = osc_styles.Tooltip
    ne.tooltipF = function ()
        local msg = state.fileSizeNormalised
        if (state.downloading)then
            msg = "Downloading..."
        end
        return msg
    end
    ne.eventresponder['mbtn_left_up'] =
        function ()
            if (not state.videoCantBeDownloaded) then
                local localpathnormal = mp.command_native({"expand-path", user_opts.downloadpath})
                local localpath = localpathnormal

                local function openFolder()
                    local device = "linux"
                    if os.getenv("windir") ~= nil then
                        device = "windows"
                    elseif os.execute '[ -d "/Applications" ]' == 0 and os.execute '[ -d "/Library" ]' == 0 or os.execute '[ -d "/Applications" ]' == true and os.execute '[ -d "/Library" ]' == true then
                        device = "mac"
                    end

                    -- for ubuntu
                    local url_browser_linux_cmd = "xdg-open \"$url\""
                    local file_browser_linux_cmd = "dbus-send --print-reply --dest=org.freedesktop.FileManager1 /org/freedesktop/FileManager1 org.freedesktop.FileManager1.ShowItems array:string:\"file:$path\" string:\"\""
                    local url_browser_macos_cmd = "open \"$url\""
                    local file_browser_macos_cmd = "open -a Finder -R \"$path\""

                    local cmd = ""
                    if device == "linux" then
                        cmd = file_browser_linux_cmd
                    elseif device == 'windows' then
                        localpath = localpath:gsub("/", "\\")
                        local ret = mp.command_native_async({
                            name = "subprocess",
                            args = {"explorer", localpath}
                        })
                    elseif device == "mac" then
                        cmd = file_browser_macos_cmd
                    end 
                    cmd = cmd:gsub("$path", localpath)
                    if device ~= 'windows' then
                        os.execute(cmd)
                    end
                end

                if state.downloadedOnce then
                    show_message("\\N{\\an9}Already downloaded")
                    openFolder()
                elseif state.downloading then
                    show_message("\\N{\\an9}Already downloading...")
                    openFolder()
                else
                    show_message("\\N{\\an9}Downloading...")
                    state.downloading = true
                    local command = { 
                        "yt-dlp",
                        user_opts.ytdlpQuality,
                        "--remux",
                        "mp4",
                        "--add-metadata",
                        "--embed-subs",
                        "-o%(title)s",
                        "-P " .. localpathnormal,
                        state.path 
                    }
                    local status = exec(command, downloadDone)                
                end
            else
                show_message("\\N{\\an9}Can't be downloaded")
            end
        end

    --screenshot
    ne = new_element('screenshot', 'button')
    ne.content = icons.screenshot
    ne.visible = (osc_param.playresx >= 900 - outeroffset - (user_opts.showloop and 0 or 100) - (user_opts.showontop and 0 or 100) - (user_opts.showinfo and 0 or 100))
    ne.eventresponder['mbtn_left_up'] =
        function ()
            local tempSubPosition = mp.get_property('sub-pos')
            mp.commandv('set', 'sub-pos', 100)
            mp.command('screenshot') -- this takes screenshots with subs, remove video to take screenshots without subs
            mp.commandv('set', 'sub-pos', tempSubPosition)
        end

    --tog_info
    ne = new_element('tog_info', 'button')
    ne.content = icons.info
    ne.visible = (osc_param.playresx >= 800 - outeroffset - (user_opts.showloop and 0 or 100) - (user_opts.showontop and 0 or 100))
    ne.eventresponder['mbtn_left_up'] =
        function () mp.commandv('script-binding', 'stats/display-stats-toggle') end

    --tog_ontop
    ne = new_element('tog_ontop', 'button')
    ne.content = function ()
        if mp.get_property('ontop') == 'no' then
            return (icons.ontopon)
        else
            return (icons.ontopoff)
        end
    end
    ne.tooltip_style = osc_styles.Tooltip
    ne.tooltipF = function ()
        local msg = texts.ontopdisable
        if mp.get_property('ontop') == 'no' then
            msg = texts.ontop
        end
        return msg
    end
    ne.visible = (osc_param.playresx >= 700 - outeroffset - (user_opts.showloop and 0 or 100))
    ne.eventresponder['mbtn_left_up'] =
        function () 
            mp.commandv('cycle', 'ontop') 
            if (state.initialborder == 'yes') then
                if (mp.get_property('ontop') == 'yes') then
                    mp.commandv('set', 'border', "no")

                else
                    mp.commandv('set', 'border', "yes")
                end
            end
        end

    ne.eventresponder['mbtn_right_up'] =
        function () 
            mp.commandv('cycle', 'ontop') 
        end
    
    --seekbar
    ne = new_element('seekbar', 'slider')
    ne.enabled = not (mp.get_property('percent-pos') == nil)
    ne.thumbnailable = true
    state.slider_element = ne.enabled and ne or nil  -- used for forced_title
    ne.slider.markerF = function ()
        local duration = mp.get_property_number('duration', nil)
        if not (duration == nil) then
            local chapters = mp.get_property_native('chapter-list', {})
            local markers = {}
            for n = 1, #chapters do
                markers[n] = (chapters[n].time / duration * 100)
            end
            return markers
        else
            return {}
        end
    end
    ne.slider.posF = function () 
            if mp.get_property_bool("eof-reached") then return 100 end
            return mp.get_property_number('percent-pos', nil) 
        end
    ne.slider.tooltipF = function (pos)
        state.touchingprogressbar = true
        local duration = mp.get_property_number('duration', nil)
        if not ((duration == nil) or (pos == nil)) then
            possec = duration * (pos / 100)
            return mp.format_time(possec)
        else
            return ''
        end
    end
    ne.slider.seekRangesF = function()
        if not user_opts.seekrange then
            return nil
        end
        local cache_state = state.cache_state
        if not cache_state then
            return nil
        end
        local duration = mp.get_property_number('duration', nil)
        if (duration == nil) or duration <= 0 then
            return nil
        end
        local ranges = cache_state['seekable-ranges']
        if #ranges == 0 then
            return nil
        end
        local nranges = {}
        for _, range in pairs(ranges) do
            nranges[#nranges + 1] = {
                ['start'] = 100 * range['start'] / duration,
                ['end'] = 100 * range['end'] / duration,
            }
        end
        return nranges
    end
    ne.eventresponder['mouse_move'] = --keyframe seeking when mouse is dragged
        function (element)
            if not element.state.mbtnleft then return end -- allow drag for mbtnleft only!
            -- mouse move events may pile up during seeking and may still get
            -- sent when the user is done seeking, so we need to throw away
            -- identical seeks
            if mp.get_property("pause") == "no" then
                state.playingWhilstSeeking = true
                mp.commandv("cycle", "pause")
            end
            local seekto = get_slider_value(element)
            if (element.state.lastseek == nil) or
                (not (element.state.lastseek == seekto)) then
                    local flags = 'absolute-percent'
                    if not user_opts.seekbarkeyframes then
                        flags = flags .. '+exact'
                    end
                    mp.commandv('seek', seekto, flags)
                    element.state.lastseek = seekto
            end

        end
    ne.eventresponder['mbtn_left_down'] = --exact seeks on left click
        function (element)
            element.state.mbtnleft = true
            mp.commandv('seek', get_slider_value(element), 'absolute-percent', 'exact')
        end
    ne.eventresponder['shift+mbtn_left_down'] = --keyframe seeks on shift+left click
        function (element)
            element.state.mbtnleft = true
            mp.commandv('seek', get_slider_value(element), 'absolute-percent')
        end
    ne.eventresponder['mbtn_left_up'] =
        function (element)
            element.state.mbtnleft = false
        end
    ne.eventresponder['mbtn_right_down'] = --seeks to chapter start
        function (element)
            if (mp.get_property_native("chapter-list/count") > 0) then
                local pos = get_slider_value(element)
                local markers = element.slider.markerF()

                -- Compares the difference between the right-clicked position
                -- and the iterated marker to determine the closest chapter
                local ch, diff
                for i, marker in ipairs(markers) do
                    if not diff or (math.abs(pos - marker) < diff) then
                        diff = math.abs(pos - marker)
                        ch = i - 1 --chapter index starts from 0
                    end
                end

                mp.commandv("set", "chapter", ch)
                if user_opts.chapters_osd then
                    show_message(get_chapterlist(), 3)
                end
            end
        end
    ne.eventresponder['reset'] =
        function (element)
            element.state.lastseek = nil
            if (state.playingWhilstSeeking) then
                if mp.get_property("eof-reached") == "no" then
                    mp.commandv("cycle", "pause")
                end
                state.playingWhilstSeeking = false
            end
        end

    --persistent seekbar
    if (user_opts.persistentprogress or user_opts.persistentprogresstoggle) then
        ne = new_element('persistentseekbar', 'slider')
        ne.enabled = not (mp.get_property('percent-pos') == nil)
        state.slider_element = ne.enabled and ne or nil  -- used for forced_title
        ne.slider.markerF = function ()
            return {}
        end
        ne.slider.posF = function () 
            if mp.get_property_bool("eof-reached") then return 100 end
            return mp.get_property_number('percent-pos', nil) 
        end 
        ne.slider.tooltipF = function()
            return ""
        end
        ne.slider.seekRangesF = function()
            if user_opts.persistentbuffer then
                if not user_opts.seekrange then
                    return nil
                end
                local cache_state = state.cache_state
                if not cache_state then
                    return nil
                end
                local duration = mp.get_property_number('duration', nil)
                if (duration == nil) or duration <= 0 then
                    return nil
                end
                local ranges = cache_state['seekable-ranges']
                if #ranges == 0 then
                    return nil
                end
                local nranges = {}
                for _, range in pairs(ranges) do
                    nranges[#nranges + 1] = {
                        ['start'] = 100 * range['start'] / duration,
                        ['end'] = 100 * range['end'] / duration,
                    }
                end
                return nranges
            end
            return nil
        end
    end

    --volumebar
    ne = new_element('volumebar', 'slider')
    ne.visible = (osc_param.playresx >= 900 - outeroffset) and user_opts.volumecontrol
    ne.enabled = (get_track('audio')>0)
    ne.slider.markerF = function ()
        return {}
    end
    ne.slider.seekRangesF = function()
      return nil
    end
    ne.slider.posF =
        function ()
            local volume = mp.get_property_number("volume", nil)
            if user_opts.volumecontrol == "log" then
                return math.sqrt(volume * 100)
            else
                return volume
            end
        end
    ne.slider.tooltipF = function (pos) return set_volume(pos) end
    ne.eventresponder["mouse_move"] =
        function (element)
            -- see seekbar code for reference
            local pos = get_slider_value(element)
            local setvol = set_volume(pos)
            if (element.state.lastseek == nil) or
                (not (element.state.lastseek == setvol)) then
                    mp.commandv("set", "volume", setvol)
                    element.state.lastseek = setvol
            end
        end
    ne.eventresponder["mbtn_left_down"] =
        function (element)
            local pos = get_slider_value(element)
            mp.commandv("set", "volume", set_volume(pos))
        end
    ne.eventresponder["reset"] =
        function (element) element.state.lastseek = nil end
    ne.eventresponder["wheel_up_press"] =
        function () mp.commandv("osd-auto", "add", "volume", 5) end
    ne.eventresponder["wheel_down_press"] =
        function () mp.commandv("osd-auto", "add", "volume", -5) end
    
    -- tc_left (current pos)
    ne = new_element('tc_left', 'button')
    ne.content = function ()
    if (state.fulltime) then
        return mp.get_property_osd('playback-time/full'):gsub('-', '')
    else
        return mp.get_property_osd('playback-time'):gsub('-', '')
    end
    end
    ne.eventresponder["mbtn_left_up"] = function ()
        state.fulltime = not state.fulltime
        request_init()
    end

    -- tc_right (total/remaining time)
    ne = new_element('tc_right', 'button')
    ne.visible = (mp.get_property_number("duration", 0) > 0)
    ne.content = function ()
        if (mp.get_property_number('duration', 0) <= 0) then return '--:--:--' end
        if (state.rightTC_trem) then
        if (state.fulltime) then
            return ('-'..mp.get_property_osd('playtime-remaining/full'))
        else
            return ('-'..mp.get_property_osd('playtime-remaining'))
        end
        else
        if (state.fulltime) then
            return (mp.get_property_osd('duration/full'))
        else
            return (mp.get_property_osd('duration'))
        end

        end
    end
    ne.eventresponder['mbtn_left_up'] =
        function () state.rightTC_trem = not state.rightTC_trem end


    -- load layout
    layouts()

    -- load window controls
    if window_controls_enabled() then
        window_controls()
    end

    --do something with the elements
    prepare_elements()
end

--
-- Other important stuff
--
function show_osc()
    -- show when disabled can happen (e.g. mouse_move) due to async/delayed unbinding
    if not state.enabled then return end

    msg.trace('show_osc')
    --remember last time of invocation (mouse move)
    state.showtime = mp.get_time()

    osc_visible(true)

    if (user_opts.fadeduration > 0) then
        state.anitype = nil
    end
end

function hide_osc()
    msg.trace('hide_osc')
    if not state.enabled then
        -- typically hide happens at render() from tick(), but now tick() is
        -- no-op and won't render again to remove the osc, so do that manually.
        state.osc_visible = false
        adjustSubtitles(false)
        render_wipe()
    elseif (user_opts.fadeduration > 0) then
        if not(state.osc_visible == false) then
            state.anitype = 'out'
            request_tick()
        end
    else
        osc_visible(false)
    end
    if thumbfast.available then
        mp.commandv("script-message-to", "thumbfast", "clear")
    end
end

function osc_visible(visible)
    if state.osc_visible ~= visible then
        state.osc_visible = visible
        adjustSubtitles(true)    -- raise subtitles
    end
    request_tick()
end

function adjustSubtitles(visible)
    if visible and user_opts.raisesubswithosc and state.osc_visible == true and (state.fullscreen == false or user_opts.showfullscreen) then
        local w, h = mp.get_osd_size()
        if h > 0 then
            local subpos = math.floor((osc_param.playresy - 175)/osc_param.playresy*100)
            if subpos < 0 then
                subpos = 100 -- out of screen, default to original position
            end
            mp.commandv('set', 'sub-pos', subpos) -- percentage
        end
    elseif user_opts.raisesubswithosc then
        mp.commandv('set', 'sub-pos', 100)
    end
end

function pause_state(name, enabled)
    -- fix OSC instantly hiding after scrubbing (initiates a 'fake' pause to stop issues when scrubbing to the end of files)
    if (state.playingWhilstSeeking) then state.playingWhilstSeekingWaitingForEnd = true return end
    if (state.playingWhilstSeekingWaitingForEnd) then state.playingWhilstSeekingWaitingForEnd = false return end
    state.paused = enabled
    if user_opts.showonpause then
        if enabled then
            visibility_mode("auto")
            show_osc()
        else
            visibility_mode("auto")
        end
    end
    request_tick()
end

function cache_state(name, st)
    state.cache_state = st
    request_tick()
end

-- Request that tick() is called (which typically re-renders the OSC).
-- The tick is then either executed immediately, or rate-limited if it was
-- called a small time ago.
function request_tick()
    if state.tick_timer == nil then
        state.tick_timer = mp.add_timeout(0, tick)
    end

    if not state.tick_timer:is_enabled() then
        local now = mp.get_time()
        local timeout = tick_delay - (now - state.tick_last_time)
        if timeout < 0 then
            timeout = 0
        end
        state.tick_timer.timeout = timeout
        state.tick_timer:resume()
    end
end

function mouse_leave()
    if get_hidetimeout() >= 0 then
        hide_osc()
    end
    -- reset mouse position
    state.last_mouseX, state.last_mouseY = nil, nil
    state.mouse_in_window = false
end

function request_init()
    state.initREQ = true
    request_tick()
end

-- Like request_init(), but also request an immediate update
function request_init_resize()
    request_init()
    -- ensure immediate update
    state.tick_timer:kill()
    state.tick_timer.timeout = 0
    state.tick_timer:resume()
end

function render_wipe()
    msg.trace('render_wipe()')
    state.osd.data = "" -- allows set_osd to immediately update on enable
    state.osd:remove()
end

function render()
    msg.trace('rendering')
    local current_screen_sizeX, current_screen_sizeY, aspect = mp.get_osd_size()
    local mouseX, mouseY = get_virt_mouse_pos()
    local now = mp.get_time()

    -- check if display changed, if so request reinit
    if not (state.mp_screen_sizeX == current_screen_sizeX
        and state.mp_screen_sizeY == current_screen_sizeY) then

        request_init_resize()

        state.mp_screen_sizeX = current_screen_sizeX
        state.mp_screen_sizeY = current_screen_sizeY
    end

    -- init management
    if state.active_element then
        -- mouse is held down on some element - keep ticking and igore initReq
        -- till it's released, or else the mouse-up (click) will misbehave or
        -- get ignored. that's because osc_init() recreates the osc elements,
        -- but mouse handling depends on the elements staying unmodified
        -- between mouse-down and mouse-up (using the index active_element).
        request_tick()
    elseif state.initREQ then
        osc_init()
        state.initREQ = false

        -- store initial mouse position
        if (state.last_mouseX == nil or state.last_mouseY == nil)
            and not (mouseX == nil or mouseY == nil) then

            state.last_mouseX, state.last_mouseY = mouseX, mouseY
        end
    end


    -- fade animation
    if not(state.anitype == nil) then

        if (state.anistart == nil) then
            state.anistart = now
        end

        if (now < state.anistart + (user_opts.fadeduration/1000)) then

            if (state.anitype == 'in') then --fade in
                osc_visible(true)
                state.animation = scale_value(state.anistart,
                    (state.anistart + (user_opts.fadeduration/1000)),
                    255, 0, now)
            elseif (state.anitype == 'out') then --fade out
                state.animation = scale_value(state.anistart,
                    (state.anistart + (user_opts.fadeduration/1000)),
                    0, 255, now)
            end

        else
            if (state.anitype == 'out') then
                osc_visible(false)
            end
            kill_animation()
        end
    else
        kill_animation()
    end

    -- mouse show/hide area
    for k,cords in pairs(osc_param.areas['showhide']) do
        set_virt_mouse_area(cords.x1, cords.y1, cords.x2, cords.y2, 'showhide')
    end
    if osc_param.areas['showhide_wc'] then
        for k,cords in pairs(osc_param.areas['showhide_wc']) do
            set_virt_mouse_area(cords.x1, cords.y1, cords.x2, cords.y2, 'showhide_wc')
        end
    else
        set_virt_mouse_area(0, 0, 0, 0, 'showhide_wc')
    end
    do_enable_keybindings()

    -- mouse input area
    local mouse_over_osc = false

    for _,cords in ipairs(osc_param.areas['input']) do
        if state.osc_visible then -- activate only when OSC is actually visible
            set_virt_mouse_area(cords.x1, cords.y1, cords.x2, cords.y2, 'input')
        end
        if state.osc_visible ~= state.input_enabled then
            if state.osc_visible then
                mp.enable_key_bindings('input')
            else
                mp.disable_key_bindings('input')
            end
            state.input_enabled = state.osc_visible
        end

        if (mouse_hit_coords(cords.x1, cords.y1, cords.x2, cords.y2)) then
            mouse_over_osc = true
        end
    end

    if osc_param.areas['window-controls'] then
        for _,cords in ipairs(osc_param.areas['window-controls']) do
            if state.osc_visible then -- activate only when OSC is actually visible
                set_virt_mouse_area(cords.x1, cords.y1, cords.x2, cords.y2, 'window-controls')
                mp.enable_key_bindings('window-controls')
            else
                mp.disable_key_bindings('window-controls')
            end

            if (mouse_hit_coords(cords.x1, cords.y1, cords.x2, cords.y2)) then
                mouse_over_osc = true
            end
        end
    end

    if osc_param.areas['window-controls-title'] then
        for _,cords in ipairs(osc_param.areas['window-controls-title']) do
            if (mouse_hit_coords(cords.x1, cords.y1, cords.x2, cords.y2)) then
                mouse_over_osc = true
            end
        end
    end

    -- autohide
    if not (state.showtime == nil) and (get_hidetimeout() >= 0) then
        local timeout = state.showtime + (get_hidetimeout()/1000) - now
        if timeout <= 0 then
            if (state.active_element == nil) and (user_opts.bottomhover or not (mouse_over_osc)) then
                if (not (state.paused and user_opts.donttimeoutonpause)) then
                    hide_osc()
                end
            end
        else
            -- the timer is only used to recheck the state and to possibly run
            -- the code above again
            if not state.hide_timer then
                state.hide_timer = mp.add_timeout(0, tick)
            end
            state.hide_timer.timeout = timeout
            -- re-arm
            state.hide_timer:kill()
            state.hide_timer:resume()
        end
    end


    -- actual rendering
    local ass = assdraw.ass_new()

    -- Messages
    render_message(ass)

    -- actual OSC
    if state.osc_visible then
        render_elements(ass)
    end
    if user_opts.persistentprogress or state.persistentprogresstoggle then
        render_persistentprogressbar(ass)
    end

    -- submit
    set_osd(osc_param.playresy * osc_param.display_aspect,
            osc_param.playresy, ass.text)
end

--
-- Event handling
--

local function element_has_action(element, action)
    return element and element.eventresponder and
        element.eventresponder[action]
end

function process_event(source, what)
    local action = string.format('%s%s', source,
        what and ('_' .. what) or '')

    if what == 'down' or what == 'press' then

        resetTimeout() -- clicking resets the hideosc timer

        for n = 1, #elements do

            if mouse_hit(elements[n]) and
                elements[n].eventresponder and
                (elements[n].eventresponder[source .. '_up'] or
                    elements[n].eventresponder[action]) then

                if what == 'down' then
                    state.active_element = n
                    state.active_event_source = source
                end
                -- fire the down or press event if the element has one
                if element_has_action(elements[n], action) then
                    elements[n].eventresponder[action](elements[n])
                end

            end
        end

    elseif what == 'up' then

        if elements[state.active_element] then
            local n = state.active_element

            if n == 0 then
                --click on background (does not work)
            elseif element_has_action(elements[n], action) and
                mouse_hit(elements[n]) then

                elements[n].eventresponder[action](elements[n])
            end

            --reset active element
            if element_has_action(elements[n], 'reset') then
                elements[n].eventresponder['reset'](elements[n])
            end

        end
        state.active_element = nil
        state.mouse_down_counter = 0

    elseif source == 'mouse_move' then

        state.mouse_in_window = true

        local mouseX, mouseY = get_virt_mouse_pos()
        if (user_opts.minmousemove == 0) or (not ((state.last_mouseX == nil) or (state.last_mouseY == nil)) and ((math.abs(mouseX - state.last_mouseX) >= user_opts.minmousemove) or (math.abs(mouseY - state.last_mouseY) >= user_opts.minmousemove))) then
                if user_opts.bottomhover then -- if enabled, only show osc if mouse is hovering at the bottom of the screen (where the UI elements are)
                    if (mouseY > osc_param.playresy - 200) or ((not state.border or state.fullscreen) and mouseY < 40) then -- account for scaling options
                        show_osc()
                    else
                        hide_osc()
                    end
                else
                    show_osc()
                end
        end
        state.last_mouseX, state.last_mouseY = mouseX, mouseY

        local n = state.active_element
        if element_has_action(elements[n], action) then
            elements[n].eventresponder[action](elements[n])
        end
    end

    -- ensure rendering after any (mouse) event - icons could change etc
    request_tick()
end

local logo_lines = {
    -- White border
    "{\\c&HE5E5E5&\\p6}m 895 10 b 401 10 0 410 0 905 0 1399 401 1800 895 1800 1390 1800 1790 1399 1790 905 1790 410 1390 10 895 10 {\\p0}",
    -- Purple fill
    "{\\c&H682167&\\p6}m 925 42 b 463 42 87 418 87 880 87 1343 463 1718 925 1718 1388 1718 1763 1343 1763 880 1763 418 1388 42 925 42{\\p0}",
    -- Darker fill
    "{\\c&H430142&\\p6}m 1605 828 b 1605 1175 1324 1456 977 1456 631 1456 349 1175 349 828 349 482 631 200 977 200 1324 200 1605 482 1605 828{\\p0}",
    -- White fill
    "{\\c&HDDDBDD&\\p6}m 1296 910 b 1296 1131 1117 1310 897 1310 676 1310 497 1131 497 910 497 689 676 511 897 511 1117 511 1296 689 1296 910{\\p0}",
    -- Triangle
    "{\\c&H691F69&\\p6}m 762 1113 l 762 708 b 881 776 1000 843 1119 911 1000 978 881 1046 762 1113{\\p0}",
}

local santa_hat_lines = {
    -- Pompoms
    "{\\c&HC0C0C0&\\p6}m 500 -323 b 491 -322 481 -318 475 -311 465 -312 456 -319 446 -318 434 -314 427 -304 417 -297 410 -290 404 -282 395 -278 390 -274 387 -267 381 -265 377 -261 379 -254 384 -253 397 -244 409 -232 425 -228 437 -228 446 -218 457 -217 462 -216 466 -213 468 -209 471 -205 477 -203 482 -206 491 -211 499 -217 508 -222 532 -235 556 -249 576 -267 584 -272 584 -284 578 -290 569 -305 550 -312 533 -309 523 -310 515 -316 507 -321 505 -323 503 -323 500 -323{\\p0}",
    "{\\c&HE0E0E0&\\p6}m 315 -260 b 286 -258 259 -240 246 -215 235 -210 222 -215 211 -211 204 -188 177 -176 172 -151 170 -139 163 -128 154 -121 143 -103 141 -81 143 -60 139 -46 125 -34 129 -17 132 -1 134 16 142 30 145 56 161 80 181 96 196 114 210 133 231 144 266 153 303 138 328 115 373 79 401 28 423 -24 446 -73 465 -123 483 -174 487 -199 467 -225 442 -227 421 -232 402 -242 384 -254 364 -259 342 -250 322 -260 320 -260 317 -261 315 -260{\\p0}",
    -- Main cap
    "{\\c&H0000F0&\\p6}m 1151 -523 b 1016 -516 891 -458 769 -406 693 -369 624 -319 561 -262 526 -252 465 -235 479 -187 502 -147 551 -135 588 -111 1115 165 1379 232 1909 761 1926 800 1952 834 1987 858 2020 883 2053 912 2065 952 2088 1000 2146 962 2139 919 2162 836 2156 747 2143 662 2131 615 2116 567 2122 517 2120 410 2090 306 2089 199 2092 147 2071 99 2034 64 1987 5 1928 -41 1869 -86 1777 -157 1712 -256 1629 -337 1578 -389 1521 -436 1461 -476 1407 -509 1343 -507 1284 -515 1240 -519 1195 -521 1151 -523{\\p0}",
    -- Cap shadow
    "{\\c&H0000AA&\\p6}m 1657 248 b 1658 254 1659 261 1660 267 1669 276 1680 284 1689 293 1695 302 1700 311 1707 320 1716 325 1726 330 1735 335 1744 347 1752 360 1761 371 1753 352 1754 331 1753 311 1751 237 1751 163 1751 90 1752 64 1752 37 1767 14 1778 -3 1785 -24 1786 -45 1786 -60 1786 -77 1774 -87 1760 -96 1750 -78 1751 -65 1748 -37 1750 -8 1750 20 1734 78 1715 134 1699 192 1694 211 1689 231 1676 246 1671 251 1661 255 1657 248 m 1909 541 b 1914 542 1922 549 1917 539 1919 520 1921 502 1919 483 1918 458 1917 433 1915 407 1930 373 1942 338 1947 301 1952 270 1954 238 1951 207 1946 214 1947 229 1945 239 1939 278 1936 318 1924 356 1923 362 1913 382 1912 364 1906 301 1904 237 1891 175 1887 150 1892 126 1892 101 1892 68 1893 35 1888 2 1884 -9 1871 -20 1859 -14 1851 -6 1854 9 1854 20 1855 58 1864 95 1873 132 1883 179 1894 225 1899 273 1908 362 1910 451 1909 541{\\p0}",
    -- Brim and tip pompom
    "{\\c&HF8F8F8&\\p6}m 626 -191 b 565 -155 486 -196 428 -151 387 -115 327 -101 304 -47 273 2 267 59 249 113 219 157 217 213 215 265 217 309 260 302 285 283 373 264 465 264 555 257 608 252 655 292 709 287 759 294 816 276 863 298 903 340 972 324 1012 367 1061 394 1125 382 1167 424 1213 462 1268 482 1322 506 1385 546 1427 610 1479 662 1510 690 1534 725 1566 752 1611 796 1664 830 1703 880 1740 918 1747 986 1805 1005 1863 991 1897 932 1916 880 1914 823 1945 777 1961 725 1979 673 1957 622 1938 575 1912 534 1862 515 1836 473 1790 417 1755 351 1697 305 1658 266 1633 216 1593 176 1574 138 1539 116 1497 110 1448 101 1402 77 1371 37 1346 -16 1295 15 1254 6 1211 -27 1170 -62 1121 -86 1072 -104 1027 -128 976 -133 914 -130 851 -137 794 -162 740 -181 679 -168 626 -191 m 2051 917 b 1971 932 1929 1017 1919 1091 1912 1149 1923 1214 1970 1254 2000 1279 2027 1314 2066 1325 2139 1338 2212 1295 2254 1238 2281 1203 2287 1158 2282 1116 2292 1061 2273 1006 2229 970 2206 941 2167 938 2138 918{\\p0}",
}

-- called by mpv on every frame
function tick()
    if (not state.enabled) then return end

    if (state.idle) then -- this is the screen mpv opens to (not playing a file directly), or if you quit a video (idle=yes in mpv.conf)

        -- render idle message
        msg.trace('idle message')
        local _, _, display_aspect = mp.get_osd_size()
        if display_aspect == 0 then
            return
        end
        local display_h = 360
        local display_w = display_h * display_aspect
        -- logo is rendered at 2^(6-1) = 32 times resolution with size 1800x1800
        local icon_x, icon_y = (display_w - 1800 / 32) / 2, 140
        local line_prefix = ('{\\rDefault\\an7\\1a&H00&\\bord0\\shad0\\pos(%f,%f)}'):format(icon_x, icon_y)

        local ass = assdraw.ass_new()
        -- mpv logo
        if user_opts.welcomescreen then
            for i, line in ipairs(logo_lines) do
                ass:new_event()
                ass:append(line_prefix .. line)
            end
        end

        -- Santa hat
        if is_december and user_opts.welcomescreen and not user_opts.noxmas then
            for i, line in ipairs(santa_hat_lines) do
                ass:new_event()
                ass:append(line_prefix .. line)
            end
        end
   
        if user_opts.welcomescreen then
            ass:new_event()
            ass:pos(display_w / 2, icon_y + 65)
            ass:an(8)
            ass:append(texts.welcome)
        end
        set_osd(display_w, display_h, ass.text)

        if state.showhide_enabled then
            mp.disable_key_bindings('showhide')
            mp.disable_key_bindings('showhide_wc')
            state.showhide_enabled = false
        end


    elseif (state.fullscreen and user_opts.showfullscreen)
        or (not state.fullscreen and user_opts.showwindowed) then

        -- render the OSC
        render()
    else
        -- Flush OSD
        render_wipe()
    end

    state.tick_last_time = mp.get_time()

    if state.anitype ~= nil then
        -- state.anistart can be nil - animation should now start, or it can
        -- be a timestamp when it started. state.idle has no animation.
        if not state.idle and
           (not state.anistart or
            mp.get_time() < 1 + state.anistart + user_opts.fadeduration/1000)
        then
            -- animating or starting, or still within 1s past the deadline
            request_tick()
        else
            kill_animation()
        end
    end
end

function do_enable_keybindings()
    if state.enabled then
        if not state.showhide_enabled then
            mp.enable_key_bindings('showhide', 'allow-vo-dragging+allow-hide-cursor')
            mp.enable_key_bindings('showhide_wc', 'allow-vo-dragging+allow-hide-cursor')
        end
        state.showhide_enabled = true
    end
end

function enable_osc(enable)
    state.enabled = enable
    if enable then
        do_enable_keybindings()
    else
        hide_osc() -- acts immediately when state.enabled == false
        if state.showhide_enabled then
            mp.disable_key_bindings('showhide')
            mp.disable_key_bindings('showhide_wc')
        end
        state.showhide_enabled = false
    end
end

validate_user_opts()

mp.register_event('start-file', newfilereset)
mp.register_event("file-loaded", startupevents)
mp.observe_property('track-list', nil, request_init)
mp.observe_property('playlist', nil, request_init)
mp.observe_property("chapter-list", "native", function(_, list) -- chapter list changes
    list = list or {}  -- safety, shouldn't return nil
    table.sort(list, function(a, b) return a.time < b.time end)
    state.chapter_list = list
    request_init()
end)
mp.observe_property('seeking', nil, function()
    resetTimeout()
end)

if user_opts.keybindings then
    -- chapter scrubbing
    mp.add_key_binding("CTRL+LEFT", "prevfile", function()
        mp.commandv('playlist-prev', 'weak')
        destroyscrollingkeys()
    end);
    mp.add_key_binding("CTRL+RIGHT", "nextfile", function()
        mp.commandv('playlist-next', 'weak')
        destroyscrollingkeys()
    end);
    mp.add_key_binding("SHIFT+LEFT", "prevchapter", function()
        changeChapter(-1)
    end);
    mp.add_key_binding("SHIFT+RIGHT", "nextchapter", function()
        changeChapter(1)
    end);

    function changeChapter(number)
        mp.commandv("add", "chapter", number)
        resetTimeout()
        show_message(get_chapterlist())
    end

    -- extra key bindings
    mp.add_key_binding("x", "cycleaudiotracks", function()
        set_track('audio', 1) show_message(get_tracklist('audio'))
    end);

    mp.add_key_binding("c", "cyclecaptions", function()
        set_track('sub', 1) show_message(get_tracklist('sub'))
    end);

    if (user_opts.persistentprogresstoggle) then
        mp.add_key_binding("b", "persistenttoggle", function()
            state.persistentprogresstoggle = not state.persistentprogresstoggle
            tick()
            print("Persistent progress bar toggled")
        end);
    end

    if (user_opts.showdescription) then
        mp.add_key_binding("d", "showdescription", checkDesc);
    end

    mp.add_key_binding("TAB", 'get_chapterlist', function() show_message(get_chapterlist()) end)

    mp.add_key_binding("p", "pinwindow", function()
        mp.commandv('cycle', 'ontop')
        if (state.initialborder == 'yes') then
            if (mp.get_property('ontop') == 'yes') then
                show_message("Pinned window")
                mp.commandv('set', 'border', "no")
            else
                show_message("Unpinned window")
                mp.commandv('set', 'border', "yes")
            end
        end
    end);

    mp.add_key_binding(nil, 'show_osc', function() show_osc() end)
end

mp.observe_property('fullscreen', 'bool',
    function(name, val)
        state.fullscreen = val
        request_init_resize()
    end
)
mp.observe_property('mute', 'bool',
    function(name, val)
        state.mute = val
    end
)
mp.observe_property('loop-file', 'bool',
    function(name, val) -- ensure compatibility with auto looping scripts (eg: a script that sets videos under 2 seconds to loop by default)
        if (val == nil) then 
            state.looping = true;
        else 
            state.looping = false
        end
    end
)
mp.observe_property('border', 'bool',
    function(name, val)
        state.border = val
        request_init_resize()
    end
)
mp.observe_property('window-maximized', 'bool',
    function(name, val)
        state.maximized = val
        request_init_resize()
    end
)
mp.observe_property('idle-active', 'bool',
    function(name, val)
        state.idle = val
        request_tick()
    end
)
mp.observe_property('pause', 'bool', pause_state)
mp.observe_property('demuxer-cache-state', 'native', cache_state)
mp.observe_property('vo-configured', 'bool', function(name, val)
    request_tick()
end)
mp.observe_property('playback-time', 'number', function(name, val)
    request_tick()
end)
mp.observe_property('osd-dimensions', 'native', function(name, val)
    -- (we could use the value instead of re-querying it all the time, but then
    --  we might have to worry about property update ordering)
    request_init_resize()
end)
-- mouse show/hide bindings
mp.set_key_bindings({
    {'mouse_move',              function(e) process_event('mouse_move', nil) end},
    {'mouse_leave',             mouse_leave},
}, 'showhide', 'force')
mp.set_key_bindings({
    {'mouse_move',              function(e) process_event('mouse_move', nil) end},
    {'mouse_leave',             mouse_leave},
}, 'showhide_wc', 'force')
do_enable_keybindings()

--mouse input bindings
mp.set_key_bindings({
    {"mbtn_left",           function(e) process_event("mbtn_left", "up") end,
                            function(e) process_event("mbtn_left", "down")  end},
    {"shift+mbtn_left",     function(e) process_event("shift+mbtn_left", "up") end,
                            function(e) process_event("shift+mbtn_left", "down")  end},
    {"shift+mbtn_right",    function(e) process_event("shift+mbtn_right", "up") end,
                            function(e) process_event("shift+mbtn_right", "down")  end},
    {"mbtn_right",          function(e) process_event("mbtn_right", "up") end,
                            function(e) process_event("mbtn_right", "down")  end},
    -- alias to shift_mbtn_left for single-handed mouse use
    {"mbtn_mid",            function(e) process_event("shift+mbtn_left", "up") end,
                            function(e) process_event("shift+mbtn_left", "down")  end},
    {"wheel_up",            function(e) process_event("wheel_up", "press") end},
    {"wheel_down",          function(e) process_event("wheel_down", "press") end},
    {"mbtn_left_dbl",       "ignore"},
    {"shift+mbtn_left_dbl", "ignore"},
    {"mbtn_right_dbl",      "ignore"},
}, "input", "force")
mp.enable_key_bindings('input')

mp.set_key_bindings({
    {'mbtn_left',           function(e) process_event('mbtn_left', 'up') end,
                            function(e) process_event('mbtn_left', 'down')  end},
}, 'window-controls', 'force')
mp.enable_key_bindings('window-controls')

function get_hidetimeout()
    return user_opts.hidetimeout
end

function resetTimeout()
    state.showtime = mp.get_time() 
end

-- mode can be auto/always/never/cycle
-- the modes only affect internal variables and not stored on its own.
function visibility_mode(mode)
    enable_osc(true)

    mp.set_property_native("user-data/osc/visibility", mode)

    -- Reset the input state on a mode change. The input state will be
    -- recalcuated on the next render cycle, except in 'never' mode where it
    -- will just stay disabled.
    mp.disable_key_bindings('input')
    mp.disable_key_bindings('window-controls')
    state.input_enabled = false
    request_tick()
end

mp.register_script_message("thumbfast-info", function(json)
    local data = utils.parse_json(json)
    if type(data) ~= "table" or not data.width or not data.height then
        msg.error("thumbfast-info: received json didn't produce a table with thumbnail information")
    else
        thumbfast = data
    end
end)

set_virt_mouse_area(0, 0, 0, 0, 'input')
set_virt_mouse_area(0, 0, 0, 0, 'window-controls')
mp.set_property("title", "mpv")
