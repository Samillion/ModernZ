--[[

   A simple script that shows a pause indicator, on pause
   More info: https://github.com/Samillion/ModernZ/tree/main/extras#pause-indicator-lite

--]]

-- options
local opts = {
    -- indicator icon type
    indicator_icon = "pause",            -- Which icon to show as indicator? pause, play

    -- keybind
    keybind_allow = true,                -- Allow keybind to toggle pause
    keybind_set = "mbtn_left",           -- The set keybind to toggle pause
    keybind_mode = "onpause",            -- Mode to activate keybind. onpause, always

    -- icon colors & opacity
    icon_color = "#FFFFFF",              -- Icon fill color
    icon_border_color = "#111111",       -- Icon border color
    icon_opacity = 40,                   -- Icon opacity (0-100)

    -- pause icon
    rectangles_width = 30,               -- Width of rectangles
    rectangles_height = 80,              -- Height of rectangles
    rectangles_spacing = 20,             -- Spacing between the two rectangles

    -- play icon
    triangle_width = 80,                 -- Width of triangle
    triangle_height = 80,                -- height of triangle
}

local msg = require 'mp.msg'

-- convert color from hex (credit to mpv/osc.lua)
local function convert_color(color)
    if color:find("^#%x%x%x%x%x%x$") == nil then
        msg.warn("'" .. color .. "' is not a valid color")
    end
    return color:sub(6,7) .. color:sub(4,5) ..  color:sub(2,3)
end

-- convert percentage opacity (0-100) to ASS alpha values
local function convert_opacity(value)
    value = math.max(0, math.min(100, value))
    return string.format("%02X", (255 - (value * 2.55)))
end

-- init
local indicator = mp.create_osd_overlay("ass-events")

-- draw and update position based on window size
local function update_pause_indicator_position()
    local _, _, display_aspect = mp.get_osd_size()
    if display_aspect == 0 then return end

    -- colors and opaicty
    icon_color = convert_color(opts.icon_color)
    icon_border_color = convert_color(opts.icon_border_color)
    icon_opacity = convert_opacity(opts.icon_opacity)

    -- rectangles parameters
    local rect_width = opts.rectangles_width
    local rect_height = opts.rectangles_height
    local rect_spacing = opts.rectangles_spacing

    -- triangle parameters
    local triangle_width = opts.triangle_width
    local triangle_height = opts.triangle_height

    -- draw rectangles
    local rectangles = string.format([[{\an5\p1\alpha&H%s\1c&H%s&\3c&H%s&}]], 
        icon_opacity, icon_color, icon_border_color) ..
        string.format([[m 0 0 l %d 0 l %d %d l 0 %d m %d 0 l %d 0 l %d %d l %d %d]], 
        rect_width, rect_width, rect_height, rect_height, rect_width + rect_spacing, 
        rect_width + rect_spacing + rect_width, rect_width + rect_spacing + rect_width, 
        rect_height, rect_width + rect_spacing, rect_height)

    -- draw triangle
    local triangle = string.format([[{\an5\p1\alpha&H%s\1c&H%s&\3c&H%s&}]], 
        icon_opacity, icon_color, icon_border_color) ..
        string.format([[m 0 0 l %d %d l 0 %d]], 
        triangle_width, triangle_height / 2, triangle_height)

    local icon = opts.indicator_icon == "play" and triangle or rectangles

    indicator.data = icon
end

-- observe when pause state changes
mp.observe_property("pause", "bool", function(_, paused)
    mp.add_timeout(0.1, function()
        if paused then
            update_pause_indicator_position()
            indicator:update()
        else
            indicator:remove()
        end
    end)

    -- set keybind (only if opts allow it)
    if opts.keybind_allow == true then
        mp.set_key_bindings({
           {opts.keybind_set, function() mp.commandv("cycle", "pause") end}
        }, "pause-indicator", "force")

        if opts.keybind_mode == "always" or (opts.keybind_mode == "onpause" and paused) then
            mp.enable_key_bindings("pause-indicator")
        elseif opts.keybind_mode == "onpause" and not paused then
            mp.disable_key_bindings("pause-indicator")
        end
    end
end)

-- update pause indicator position when window size changes
mp.observe_property("osd-dimensions", "native", function()
    if indicator and indicator.visible then
        update_pause_indicator_position()
        indicator:update()
    end
end)
