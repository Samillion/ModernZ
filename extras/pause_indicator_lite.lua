--[[

   A simple script that shows a pause indicator, on pause
   More info: https://github.com/Samillion/ModernZ/tree/main/extras#pause-indicator-lite

--]]

-- options
local opts = {
    -- indicator icon type
    indicator_icon = "pause",            -- which icon to show with indicator? pause, play

    -- keybind
    allow_keybind = true,                -- Allow keybind to toggle pause (only while indicator is active)
    used_keybind = "mbtn_left",          -- The used keybind to toggle pause.
    keybind_mode = "onpause",            -- mode to activate keybind. onpause, always

    -- pause icon
    rectangles_color = "FFFFFF",         -- Color for rectangles
    rectangles_border_color = "111111",  -- Color for rectangle borders
    rectangles_opacity = 40,             -- Opacity of rectangles (0-100)
    rectangles_width = 30,               -- Width of rectangles
    rectangles_height = 80,              -- Height of rectangles
    rectangles_spacing = 20,             -- Spacing between the two rectangles

    -- play icon
    triangle_color = "FFFFFF",           -- Color of triangle
    triangle_border_color = "111111",    -- Color of triangle borders
    triangle_opacity = 40,               -- Opacity of triangle (0-100)
    triangle_width = 80,                 -- Width of triangle
    triangle_height = 80,                -- height of triangle
}

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
		
    -- rectangles parameters
    local rect_width = opts.rectangles_width
    local rect_height = opts.rectangles_height
    local rect_spacing = opts.rectangles_spacing

    -- triangle parameters
    local triangle_width = opts.triangle_width
    local triangle_height = opts.triangle_height or 75 

    -- convert opacity to ASS format
    local rect_alpha = convert_opacity(opts.rectangles_opacity)
    local triangle_alpha = convert_opacity(opts.triangle_opacity)

    -- draw rectangles
    local rectangles = string.format([[{\an5\p1\alpha&H%s\1c&H%s&\3c&H%s&}]], 
        rect_alpha, opts.rectangles_color, opts.rectangles_border_color) ..
        string.format([[m 0 0 l %d 0 l %d %d l 0 %d m %d 0 l %d 0 l %d %d l %d %d]], 
        rect_width, rect_width, rect_height, rect_height, rect_width + rect_spacing, 
        rect_width + rect_spacing + rect_width, rect_width + rect_spacing + rect_width, 
        rect_height, rect_width + rect_spacing, rect_height)

    -- draw triangle
    local triangle = string.format([[{\an5\p1\alpha&H%s\1c&H%s&\3c&H%s&}]], 
        triangle_alpha, opts.triangle_color, opts.triangle_border_color) ..
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
    if opts.allow_keybind == true then
        mp.set_key_bindings({
           {opts.used_keybind, function() mp.commandv("cycle", "pause") end}
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
