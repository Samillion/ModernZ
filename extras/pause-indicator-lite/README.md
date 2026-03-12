## Pause Indicator Lite
![pause_indicator_preview](https://github.com/user-attachments/assets/a70653fd-2d88-4e86-b03d-8f00a5f94cd9)

A simple script that displays an indicator on pause (and mute), with options to adjust icon type, color, height, width, opacity and whether to toggle pause with a keybind or not.

You can choose from multiple themes:
- Native: Doesn't require a font file
- Themed: `fluent` or `material` themes with `icon_theme` option
  - Must set `themed_icons=yes`, which requires [`modernz-icons.ttf`](/modernz-icons.ttf)
  - Each theme has different styles, `outline` or `filled`. Which can be set with `theme_style` option

**Script:** [Pause Indicator Lite](./pause_indicator_lite.lua)

### Indicator Options
Below is the full list for indicator options and their default values. 

To adjust them you can either: 
- Place [pause_indicator_lite.conf](./pause_indicator_lite.conf) in `script-opts` and change the values in it [recommended]
- Simply change their values in `local options` within the script itself

| Option                   | Value           | Description                                                                                                                                |
|--------------------------|-----------------|--------------------------------------------------------------------------------------------------------------------------------------------|
| `indicator_icon`         | pause           | indicator icon type.  `pause`, `play`                                                                                                      |
| `indicator_stay`         | yes             | keep indicator visibile during pause                                                                                                       |
| `indicator_timeout`      | 0.6             | timeout (seconds) if indicator doesn't stay                                                                                                |
| `indicator_pos`          | middle_center   | position of indicator<br>`top_left`, `top_right`, `top_center`. also: `middle_*`, `bottom_*`<br>same as `top_*` (ie: `bottom_right`)       |
| `keybind_allow`          | no              | allow keybind to toggle pause                                                                                                              |
| `keybind_set`            | shift+mbtn_left | the used keybind to toggle pause [[reference](https://github.com/mpv-player/mpv/blob/master/etc/input.conf)]                               |
| `keybind_mode`           | onpause         | mode to activate keybind<br>`onpause`: only active when paused, to unpause<br>`always`: always active to toggle pause/unpause              |
| `keybind_eof_disable`    | yes             | disable keybind on eof (end of file) [[reference](https://github.com/Samillion/ModernZ/issues/291)]                                        |
| `icon_color`             | `#FFFFFF`       | icon fill color                                                                                                                            |
| `icon_border_color`      | `#111111`       | icon border color                                                                                                                          |
| `icon_border_width`      | 1.5             | icon border width                                                                                                                          |
| `icon_opacity`           | 40              | icon opacity (0-100)                                                                                                                       |
| `rectangles_width`       | 30              | width of rectangles (pause icon)                                                                                                           |
| `rectangles_height`      | 80              | height of rectangles (pause icon)                                                                                                          |
| `rectangles_spacing`     | 20              | spacing between the two rectangles (pause icon)                                                                                            |
| `triangle_width`         | 80              | width of triangle (play icon)                                                                                                              |
| `triangle_height`        | 80              | height of triangle (play icon)                                                                                                             |
| `flash_play_icon`        | yes             | flash play icon on unpause (best with pause indicator icon)                                                                                |
| `flash_icon_timeout`     | 0.3             | timeout (seconds) for flash icon                                                                                                           |
| `themed_icons`           | no              | use icon theme specified in `icon_theme` requires `fonts/modernz-icons.ttf`                                                                |
| `icon_theme`             | fluent          | set icon theme. accepts `fluent` or `material`                                                                                             |
| `theme_style`            | outline         | set theme style. accepts `outline` or `filled`                                                                                             |
| `themed_icon_size`       | 80              | themed icon size                                                                                                                           |
| `mute_indicator`         | no              | show a mute indicator                                                                                                                      |
| `mute_indicator_pos`     | top_right       | position of mute indicator<br>`top_left`, `top_right`, `top_center`. also: `middle_*`, `bottom_*`<br>same as `top_*` (ie: `bottom_right`)  |
| `mute_icon_size`         | 50              | mute indicator size                                                                                                                        |

### How to install

Simply place `pause_indicator_lite.lua` in the corresponding mpv scripts folder of your operating system:

- Windows: `%APPDATA%\mpv\scripts\` or `C:\users\USERNAME\AppData\Roaming\mpv\scripts\`
- Linux: `~/.config/mpv/scripts/` or `/home/USERNAME/.config/mpv/scripts/`
- Mac: `~/.config/mpv/scripts/` or `/Users/USERNAME/.config/mpv/scripts/`

```
📁 mpv/
├── 📁 fonts/
│   └── 📄 modernz-icons.ttf
├── 📁 script-opts/
│   └── 📄 pause_indicator_lite.conf
└── 📁 scripts/
    └── 📄 pause_indicator_lite.lua
```

> [!TIP]
> More information about mpv files locations can be found  [here](https://mpv.io/manual/master/#files)

### Notes

- I don't plan to focus many updates on this script, because ASS drawing and positioning pisses me off. 😝 
- Other alternatives can be found in the mpv [user scripts](https://github.com/mpv-player/mpv/wiki/User-Scripts) wiki.
- This isn't exclusive to be used on ModernZ OSC. Feel free to use it with whatever you want.
