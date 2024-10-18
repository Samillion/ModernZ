## Pause Indicator Lite
| ![pause-icon](https://github.com/user-attachments/assets/cd41333c-8fdd-4de9-8977-15eea95798dc) | ![play-icon](https://github.com/user-attachments/assets/0d1671f8-9b1b-4f10-ade3-82d1748b2d93) |
|:---:|:---:|

A simple script that displays an indicator on pause, with options to adjust icon, color, height, width, opacity and whether to toggle pause with a keybind or not.

I only decided to write this because the ones I found were either too complicated or too simple. The alternatives are great, this one just meets my simple use case scenario.

**Script:** [Pause Indicator Lite](./pause_indicator_lite.lua)

**Options:**
```lua
local opts = {
    indicator_icon = "play",             -- what icon to show with indicator? pause, play

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

    -- keybind
    allow_keybind = true,                -- Allow keybind to toggle pause (only while indicator is active)
    used_keybind = "mbtn_left",          -- The used keybind to toggle pause. Left mouse click as default
}
```

> [!NOTE]
> I don't plan to focus many updates on this script, because ASS drawing and positioning pisses me off. 😝 
> 
> Other alternatives can be found in the mpv [user scripts](https://github.com/mpv-player/mpv/wiki/User-Scripts) wiki.

This isn't exclusive to be used on ModernZ OSC. Feel free to use it with whatever you want.
