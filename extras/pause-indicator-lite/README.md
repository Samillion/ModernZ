## Pause Indicator Lite
| ![pause-icon](https://github.com/user-attachments/assets/cd41333c-8fdd-4de9-8977-15eea95798dc) | ![play-icon](https://github.com/user-attachments/assets/0d1671f8-9b1b-4f10-ade3-82d1748b2d93) |
|:---:|:---:|

A simple script that displays an indicator on pause (and mute), with options to adjust icon type, color, height, width, opacity and whether to toggle pause with a keybind or not.

I only decided to write this because the ones I found were either too complicated or too simple. The alternatives are great, this one just meets my simple use case scenario.

**Script:** [Pause Indicator Lite](./pause_indicator_lite.lua)

### Indicator Options
Below is the full list for indicator options and their default values. 

To adjust them you can either: 
- Place [pause_indicator_lite.conf](./pause_indicator_lite.conf) in `script-opts` and change the values in it [recommended]
- Simply change their values in `local options` within the script itself

| Option                   | Value       | Description                                                                                                                          |
|--------------------------|-------------|--------------------------------------------------------------------------------------------------------------------------------------|
| `indicator_icon`         | pause       | indicator icon type.  `pause`, `play`                                                                                                |
| `indicator_stay`         | yes         | keep indicator visibile during pause                                                                                                 |
| `indicator_timeout`      | 0.6         | timeout (seconds) if indicator doesn't stay                                                                                          |
| `keybind_allow`          | yes         | allow keybind to toggle pause                                                                                                        |
| `keybind_set`            | mbtn_left   | the used keybind to toggle pause [[reference](https://github.com/mpv-player/mpv/blob/master/etc/input.conf)]                         |
| `keybind_mode`           | onpause     | mode to activate keybind. <br>`onpause`: only active when paused, to unpause <br>`always`: always active to toggle pause/unpause     |
| `keybind_eof_disable`    | yes         | disable keybind on eof (end of file) [[reference](https://github.com/Samillion/ModernZ/issues/291)]                                  |
| `icon_color`             | `#FFFFFF`   | icon fill color                                                                                                                      |
| `icon_border_color`      | `#111111`   | icon border color                                                                                                                    |
| `icon_border_width`      | 1.5         | icon border width                                                                                                                    |
| `icon_opacity`           | 40          | icon opacity (0-100)                                                                                                                 |
| `rectangles_width`       | 30          | width of rectangles (pause icon)                                                                                                     |
| `rectangles_height`      | 80          | height of rectangles (pause icon)                                                                                                    |
| `rectangles_spacing`     | 20          | spacing between the two rectangles (pause icon)                                                                                      |
| `triangle_width`         | 80          | width of triangle (play icon)                                                                                                        |
| `triangle_height`        | 80          | height of triangle (play icon)                                                                                                       |
| `flash_play_icon`        | yes         | flash play icon on unpause (best with pause indicator icon)                                                                          |
| `flash_icon_timeout`     | 0.3         | timeout (seconds) for flash icon                                                                                                     |
| `icon_theme`             | fluent      | requires `fonts/fluent-system-icons.ttf` [[details](https://github.com/Samillion/ModernZ/pull/336)] for fluent and `fonts/material-design-icons.ttf` for material themes |
| `themed_icons`           | no          | use icon theme specified in `icon_theme`                                                                                        |
| `themed_icon_size`       | 80          | fluent icon size                                                                                                                     |
| `mute_indicator`         | no          | show a mute indicator (requires fluent font)                                                                                         |
| `mute_indicator_pos`     | middle_right | position of mute indicator. `top_left`, `top_right`, `top_center`. also: `middle_*`, `bottom_*` same as `top_*` (ie: `bottom_right`) |

### How to install

Simply place `pause_indicator_lite.lua` in the corresponding mpv scripts folder of your operating system:

- Windows: `%APPDATA%\mpv\scripts\` or `C:\users\USERNAME\AppData\Roaming\mpv\scripts\`
- Linux: `~/.config/mpv/scripts/` or `/home/USERNAME/.config/mpv/scripts/`
- Mac: `~/.config/mpv/scripts/` or `/Users/USERNAME/.config/mpv/scripts/`

> [!TIP]
> More information about mpv files locations can be found  [here](https://mpv.io/manual/master/#files)

```
mpv
├── fonts/
│   └── fluent-system-icons.ttf (optional) [required for fluent_icons]
├── script-opts
│   └── pause_indicator_lite.conf
└── scripts
    └── pause_indicator_lite.lua
```

### Notes

- I don't plan to focus many updates on this script, because ASS drawing and positioning pisses me off. 😝 
- Other alternatives can be found in the mpv [user scripts](https://github.com/mpv-player/mpv/wiki/User-Scripts) wiki.
- This isn't exclusive to be used on ModernZ OSC. Feel free to use it with whatever you want.
