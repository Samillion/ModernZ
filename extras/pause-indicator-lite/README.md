## Pause Indicator Lite
| ![pause-icon](https://github.com/user-attachments/assets/cd41333c-8fdd-4de9-8977-15eea95798dc) | ![play-icon](https://github.com/user-attachments/assets/0d1671f8-9b1b-4f10-ade3-82d1748b2d93) |
|:---:|:---:|

A simple script that displays an indicator on pause, with options to adjust icon, color, height, width, opacity and whether to toggle pause with a keybind or not.

I only decided to write this because the ones I found were either too complicated or too simple. The alternatives are great, this one just meets my simple use case scenario.

**Script:** [Pause Indicator Lite](./pause_indicator_lite.lua)

### Indicator Options
Below is the full list for indicator options and their default values. To adjust them, simply change their values in `local opts` within the script.

| Option                   | Value       | Description                                                                                                                                   |
|--------------------------|-------------|-----------------------------------------------------------------------------------------------------------------------------------------------|
| `indicator_icon`         | "pause"     | Which icon to show as indicator `pause`, `play`                                                                                               |
| `indicator_stay`         | true        | Should the pause indicator stay visible during pause?                                                                                         |
| `indicator_stay_timeout` | 0.6         | If it doesn't stay, how long should it last? (seconds)                                                                                        |
| `keybind_allow`          | true        | Allow keybind to toggle pause                                                                                                                 |
| `keybind_set`            | "mbtn_left" | The set keybind to toggle pause [[reference](https://github.com/mpv-player/mpv/blob/master/etc/input.conf)]                                   |
| `keybind_mode`           | "onpause"   | Mode to activate keybind. <br />`onpause`: only active when video is paused, to unpause <br />`always`: always active to toggle pause/unpause |
| `icon_color`             | "#FFFFFF"   | Icon fill color                                                                                                                               |
| `icon_border_color`      | "#111111"   | Icon border color                                                                                                                             |
| `icon_opacity`           | 40          | Icon opacity (0-100)                                                                                                                          |
| `rectangles_width`       | 30          | Width of rectangles (pause icon)                                                                                                              |
| `rectangles_height`      | 80          | Height of rectangles (pause icon)                                                                                                             |
| `rectangles_spacing`     | 20          | Spacing between the two rectangles (pause icon)                                                                                               |
| `triangle_width`         | 80          | Width of triangle (play icon)                                                                                                                 |
| `triangle_height`        | 80          | Height of triangle (play icon)                                                                                                                |
| `flash_play_icon`        | true        | Flash play icon on unpause? (best with pause indicator icon)                                                                                  |
| `flash_icon_timeout`     | 0.3         | How long should the flash last? (seconds)                                                                                                     |
| `flash_icon_bigger_by`   | 0           | Increase flash icon size from default by (0-100)                                                                                              |

### How to install

Simply place `pause_indicator_lite.lua` in the corresponding mpv scripts folder of your operating system:

- Windows: `%APPDATA%\mpv\scripts\` or `C:\users\USERNAME\AppData\Roaming\mpv\scripts\`
- Linux: `~/.config/mpv/scripts/` or `/home/USERNAME/.config/mpv/scripts/`
- Mac: `~/.config/mpv/scripts/` or `/Users/USERNAME/.config/mpv/scripts/`

> [!TIP]
> More information about mpv files locations can be found  [here](https://mpv.io/manual/master/#files)

```
config/mpv
│   input.conf
│   mpv.conf
│
└───scripts
        pause_indicator_lite.lua
```

### Notes

- I don't plan to focus many updates on this script, because ASS drawing and positioning pisses me off. 😝 
- Other alternatives can be found in the mpv [user scripts](https://github.com/mpv-player/mpv/wiki/User-Scripts) wiki.
- This isn't exclusive to be used on ModernZ OSC. Feel free to use it with whatever you want.
