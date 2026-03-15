--[[

   A simple script that shows a pause indicator, on pause
   https://github.com/Samillion/ModernZ/tree/main/extras/pause-indicator-lite

--]]

local options = {
    -- indicator icon type
    indicator_icon = "pause",             -- indicator icon type. "pause", "play"
    indicator_stay = true,                -- keep indicator visibile during pause
    indicator_timeout = 0.6,              -- timeout (seconds) if indicator doesn't stay
    indicator_pos = "middle_center",      -- position of indicator. top_left, top_right, top_center
                                          -- also: middle_*, bottom_* same as top_* (ie: bottom_right)

    -- keybind
    keybind_allow = false,                -- allow keybind to toggle pause
    keybind_set = "shift+mbtn_left",      -- the used keybind to toggle pause
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
    icon_theme = "fluent",                -- set icon theme. accepts "fluent" or "material"
    theme_style = "outline",              -- set theme style. accepts "outline" or "filled"
    themed_icons = false,                 -- requires fonts/modernz-icons.ttf
    themed_icon_size = 80,                -- themed icon size

    -- mute options
    mute_indicator = false,               -- show a mute indicator
    mute_indicator_pos = "top_right",     -- position of mute indicator. top_left, top_right, top_center
                                          -- also: middle_*, bottom_* same as top_* (ie: bottom_right)

    mute_icon_size = 50,                  -- size of the mute speaker icon
}

local msg = require "mp.msg"
require 'mp.options'.read_options(options, "pause_indicator_lite")

local icon_theme = {
    fluent = {
        filled = {
            pause_icon = "fluent_pause_filled",
            play_icon  = "fluent_play_arrow_filled",
            mute_icon  = "fluent_volume_off_filled"
        },
        outline = {
            pause_icon = "fluent_pause",
            play_icon  = "fluent_play_arrow",
            mute_icon  = "fluent_volume_off"
        }
    },
    material = {
        filled = {
            pause_icon = "material_pause_filled",
            play_icon  = "material_play_arrow_filled",
            mute_icon  = "material_volume_off_filled"
        },
        outline = {
            pause_icon = "material_pause",
            play_icon  = "material_play_arrow",
            mute_icon  = "material_volume_off"
        }
    },
    font = "modernz-icons"
}

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

-- colors and opacity
local icon_color = convert_color(options.icon_color)
local icon_border_color = convert_color(options.icon_border_color)
local icon_opacity = convert_opacity(options.icon_opacity)
local icons = icon_theme[options.icon_theme] and icon_theme[options.icon_theme][options.theme_style] or icon_theme["fluent"]["outline"]
local icon_font = icon_theme.font

-- indicator position
local function icon_pos(pos_opt)
    local pos = {
        top_left    = 7, top_center    = 8, top_right    = 9,
        middle_left = 4, middle_center = 5, middle_right = 6,
        bottom_left = 1, bottom_center = 2, bottom_right = 3,
    }
    return pos[(pos_opt or ""):lower()] or 5
end

local indicator_pos = icon_pos(options.indicator_pos)
local mute_indicator_pos = icon_pos(options.mute_indicator_pos)

-- prevent duplicate positions
if indicator_pos == mute_indicator_pos then
    mute_indicator_pos = (mute_indicator_pos % 9) + 1
end

-- pause icon
local function draw_rectangles()
    if options.themed_icons then
        return string.format([[{\\rDefault\\an%s\\alpha&H%s\\bord%s\\1c&H%s&\\3c&H%s&\\fs%s\\fn%s}%s]],
            indicator_pos, icon_opacity, options.icon_border_width, icon_color, icon_border_color, options.themed_icon_size, icon_font, icons.pause_icon)
    else
        return string.format([[{\\rDefault\\p1\\an%s\\alpha&H%s\\bord%s\\1c&H%s&\\3c&H%s&}m 0 0 l %d 0 l %d %d l 0 %d m %d 0 l %d 0 l %d %d l %d %d{\\p0}]],
            indicator_pos, icon_opacity, options.icon_border_width, icon_color, icon_border_color, options.rectangles_width, options.rectangles_width, 
            options.rectangles_height, options.rectangles_height, options.rectangles_width + options.rectangles_spacing, 
            options.rectangles_width * 2 + options.rectangles_spacing, options.rectangles_width * 2 + options.rectangles_spacing, 
            options.rectangles_height, options.rectangles_width + options.rectangles_spacing, options.rectangles_height)
    end
end

-- play icon
local function draw_triangle()
    if options.themed_icons then
        return string.format([[{\\rDefault\\an%s\\alpha&H%s\\bord%s\\1c&H%s&\\3c&H%s&\\fs%s\\fn%s}%s]],
            indicator_pos, icon_opacity, options.icon_border_width, icon_color, icon_border_color, options.themed_icon_size, icon_font, icons.play_icon)
    else
        return string.format([[{\\rDefault\\p1\\an%s\\alpha&H%s\\bord%s\\1c&H%s&\\3c&H%s&}m 0 0 l %d %d l 0 %d{\\p0}]],
            indicator_pos, icon_opacity, options.icon_border_width, icon_color, icon_border_color, options.triangle_width, options.triangle_height / 2, options.triangle_height)
    end
end

-- mute icon
local function draw_mute()
    if options.themed_icons then
        return string.format([[{\\rDefault\\an%s\\alpha&H%s\\bord%s\\1c&H%s&\\3c&H%s&\\fs%s\\fn%s}%s]],
            mute_indicator_pos, icon_opacity, options.icon_border_width,
            icon_color, icon_border_color, options.mute_icon_size, icon_font, icons.mute_icon)
    end

    -- path drawn on a 509.47x430.82 canvas
    -- fscx/fscy are %, so (target / 509.47 * 100) scales to mute_icon_size
    local scale = math.floor(options.mute_icon_size / 509.47 * 100 + 0.5)

    -- from Fticons - MIT License
    -- https://github.com/Financial-Times/fticons
    local vol_mute = "{\\p1}" ..
        -- bounding box
        "m 0 0 m 509.47 430.82 " ..
        -- speaker shape
        "m 287.33 0 " ..
        "l 106.77 135.6 " ..
        "l 104.06 138.85 " ..
        "l 0 138.85 " ..
        "l 0 292.05 " ..
        "l 104.06 292.05 " ..
        "l 106.77 295.3 " ..
        "l 287.33 430.82 " ..
        "l 304.67 422.16 " ..
        "l 304.67 8.66 " ..
        "l 287.33 0 " ..
        -- X mark
        "m 487.07 305.01 " ..
        "l 509.47 282.6 " ..
        "l 442.27 215.4 " ..
        "l 509.47 148.2 " ..
        "l 487.07 125.8 " ..
        "l 419.87 193 " ..
        "l 352.67 125.8 " ..
        "l 330.27 148.2 " ..
        "l 397.47 215.4 " ..
        "l 330.27 282.6 " ..
        "l 352.67 305 " ..
        "l 419.87 237.8 " ..
        "l 487.07 305 " ..
        "{\\p0}"

    return string.format(
        [[{\\rDefault\\an%s\\alpha&H%s\\bord%s\\1c&H%s&\\3c&H%s&\\fscx%s\\fscy%s}%s]],
        mute_indicator_pos, icon_opacity, options.icon_border_width,
        icon_color, icon_border_color, scale, scale, vol_mute)
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

if options.mute_indicator then
    mp.observe_property("mute", "bool", function(_, val)
        if val and not mute.visible then mute_icon() else mute:remove() end
    end)
else
    mute:remove()
end
