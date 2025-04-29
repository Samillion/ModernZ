--[[

   A simple script that shows a pause indicator, on pause
   https://github.com/Samillion/ModernZ/tree/main/extras/pause-indicator-lite

--]]

local options = {
    -- indicator icon type
    indicator_icon = "pause",             -- indicator icon type. "pause", "play"
    indicator_stay = true,                -- keep indicator visibile during pause
    indicator_timeout = 0.6,              -- timeout (seconds) if indicator doesn't stay

    -- keybind
    keybind_allow = true,                 -- allow keybind to toggle pause
    keybind_set = "mbtn_left",            -- the used keybind to toggle pause
    keybind_mode = "onpause",             -- mode to activate keybind. "onpause", "always"
    keybind_eof_disable = true,           -- disable keybind on eof (end of file)

    -- icon colors & opacity
    icon_color = "#FFFFFF",               -- icon fill color
    icon_border_color = "#111111",        -- icon border color
    icon_border_width = 1.5,              -- icon border width
    icon_opacity = 40,                    -- icon opacity (0-100)

    -- pause icon
    rectangles_width = 30,                -- width of rectangles
    rectangles_height = 80,               -- height of rectangles
    rectangles_spacing = 20,              -- spacing between the two rectangles

    -- play icon
    triangle_width = 80,                  -- width of triangle
    triangle_height = 80,                 -- height of triangle

    -- best with pause icon
    flash_play_icon = true,               -- flash play icon on unpause
    flash_icon_timeout = 0.3,             -- timeout (seconds) for flash icon

    -- icon style used in ModernZ osc
    fluent_icons = false,                 -- requires fonts/fluent-system-icons.ttf
    fluent_icon_size = 80,                -- fluent icon size
    
    -- mute options
    mute_indicator = false,               -- show a mute indicator (requires fluent font)
    mute_indicator_pos = "middle_right",  -- position of mute indicator. top_left, top_right, top_center
                                          -- also: middle_*, bottom_* same as top_* (ie: bottom_right)
}

local msg = require "mp.msg"
require 'mp.options'.read_options(options, "pause_indicator_lite")

-- convert color from hex (adjusted from mpv/osc.lua)
local function convert_color(color)
    if color:find("^#%x%x%x%x%x%x$") == nil then
        msg.warn("'" .. color .. "' is not a valid color, using default '#FFFFFF'")
        return "FFFFFF"  -- color fallback
    end
    return color:sub(6,7) .. color:sub(4,5) .. color:sub(2,3)
end

-- convert percentage opacity (0-100) to ASS alpha values
local function convert_opacity(value)
    value = math.max(0, math.min(100, value))
    return string.format("%02X", (255 - (value * 2.55)))
end

-- colors and opaicty
local icon_color = convert_color(options.icon_color)
local icon_border_color = convert_color(options.icon_border_color)
local icon_opacity = convert_opacity(options.icon_opacity)
local icon_font = "fluent-system-icons"

-- pause icon
local function draw_rectangles()
    if options.fluent_icons then
        local pause_icon = "\238\163\140"
        return string.format([[{\\rDefault\\an5\\alpha&H%s\\bord%s\\1c&H%s&\\3c&H%s&\\fs%s\\fn%s}%s]],
            icon_opacity, options.icon_border_width, icon_color, icon_border_color, options.fluent_icon_size, icon_font, pause_icon)
    else
        return string.format([[{\\rDefault\\p1\\an5\\alpha&H%s\\bord%s\\1c&H%s&\\3c&H%s&}m 0 0 l %d 0 l %d %d l 0 %d m %d 0 l %d 0 l %d %d l %d %d{\\p0}]],
            icon_opacity, options.icon_border_width, icon_color, icon_border_color, options.rectangles_width, options.rectangles_width, 
            options.rectangles_height, options.rectangles_height, options.rectangles_width + options.rectangles_spacing, 
            options.rectangles_width * 2 + options.rectangles_spacing, options.rectangles_width * 2 + options.rectangles_spacing, 
            options.rectangles_height, options.rectangles_width + options.rectangles_spacing, options.rectangles_height)
    end
end

-- play icon
local function draw_triangle()
    if options.fluent_icons then
        local play_icon = "\238\166\143"
        return string.format([[{\\rDefault\\an5\\alpha&H%s\\bord%s\\1c&H%s&\\3c&H%s&\\fs%s\\fn%s}%s]],
            icon_opacity, options.icon_border_width, icon_color, icon_border_color, options.fluent_icon_size, icon_font, play_icon)
    else
        return string.format([[{\\rDefault\\p1\\an5\\alpha&H%s\\bord%s\\1c&H%s&\\3c&H%s&}m 0 0 l %d %d l 0 %d{\\p0}]],
            icon_opacity, options.icon_border_width, icon_color, icon_border_color, options.triangle_width, options.triangle_height / 2, options.triangle_height)
    end
end

-- mute icon
local function draw_mute()
    if not options.fluent_icons then return end

    local mute_icon = "\238\173\138"
    local mute_pos_list = {
        ["top_left"] = 7,
        ["top_center"] = 8,
        ["top_right"] = 9,
        ["middle_left"] = 4,
        ["middle_center"] = 5,
        ["middle_right"] = 6,
        ["bottom_left"] = 1,
        ["bottom_center"] = 2,
        ["bottom_right"] = 3,
    }
    local mute_pos = mute_pos_list[options.mute_indicator_pos:lower()] or 6
    return string.format([[{\\rDefault\\an%s\\alpha&H%s\\bord%s\\1c&H%s&\\3c&H%s&\\fs%s\\fn%s}%s]],
        mute_pos, icon_opacity, options.icon_border_width, icon_color, icon_border_color, options.fluent_icon_size, icon_font, mute_icon)
end

-- initiate overlay
local indicator = mp.create_osd_overlay("ass-events")
local flash = mp.create_osd_overlay("ass-events")
local mute = mp.create_osd_overlay("ass-events")

-- keep track of pause toggle and end of file
local toggled, eof

-- draw and update indicator
local function update_indicator()
    local _, _, display_aspect = mp.get_osd_size()
    if display_aspect == 0 or (indicator.visible and not toggled) then return end

    indicator.data = options.indicator_icon == "play" and draw_triangle() or draw_rectangles()
    indicator:update()

    if not options.indicator_stay then
        mp.add_timeout(options.indicator_timeout, function() indicator:remove() end)
    end
end

-- flash play icon
local function flash_icon()
    if not options.flash_play_icon then return flash:remove() end
    flash.data = draw_triangle()
    flash:update()
    mp.add_timeout(options.flash_icon_timeout, function() flash:remove() end)
end

-- draw mute icon
local function mute_icon()
    mute.data = draw_mute()
    mute:update()
end

-- check if file is video
local function is_video()
    local t = mp.get_property_native("current-tracks/video")
    return t and not (t.image or t.albumart) and true or false
end

-- remove overlays
local function shutdown()
    if flash then flash:remove() end
    if indicator then indicator:remove() end
    mp.unobserve_property("pause")
end

-- end of file keybind check
if options.keybind_eof_disable then
    mp.observe_property("eof-reached", "bool", function(_, val)
        eof = val
    end)
end

-- observe when pause state changes
mp.observe_property("pause", "bool", function(_, paused)
    if not is_video() then return shutdown() end
    if paused then
        update_indicator()
        toggled = true
        if options.flash_play_icon then flash:remove() end
    else
        indicator:remove()
        if toggled then
            flash_icon()
            toggled = false
        end
    end

    -- keybind setup (if options allow it)
    if options.keybind_allow == true then
        mp.set_key_bindings({
           {options.keybind_set, function() mp.commandv("cycle", "pause") end}
        }, "pause-indicator", "force")

        if options.keybind_mode == "always" or (options.keybind_mode == "onpause" and paused) then
            if not eof then mp.enable_key_bindings("pause-indicator") end
        else
            mp.disable_key_bindings("pause-indicator")
        end
    end
end)

-- update pause indicator position if window size changes
mp.observe_property("osd-dimensions", "native", function()
    if indicator and indicator.visible then
        update_indicator()
    end
end)

if options.mute_indicator and options.fluent_icons then
    mp.observe_property("mute", "bool", function(_, val)
        if val and not mute.visible then mute_icon() else mute:remove() end
    end)
else
    mute:remove()
end
