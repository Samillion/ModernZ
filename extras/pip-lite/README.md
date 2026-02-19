## PiP Lite (Picture-in-Picture)
This script adds a PiP mode when pin (ontop) is enabled, it also enhances the pin button on ModernZ turning it into a PiP button.

When pin is enabled, window is resized and moved to bottom right, all fit and positions can be adjusted in `pip_lite.conf`.

### Options
To adjust them you can either: 
- Place [pip_lite.conf](./pip_lite.conf) in `script-opts` and change the values in it [recommended]
- Simply change their values in `local options` within the script itself

| Option              | Value         | Description                                                                                                            |
|---------------------|---------------|------------------------------------------------------------------------------------------------------------------------|
| `autofit`           | `40%x30%`     | [autofit](https://mpv.io/manual/master/#options-autofit) option when pip is enabled                                    |
| `autofit_larger`    | `40%x30%`     | [autofit-larger](https://mpv.io/manual/master/#options-autofit-larger) option when pip is enabled                      |
| `geometry`          | `100%:100%`   | window position when PiP is enabled. Default: bottom-right [[details](https://mpv.io/manual/master/#options-geometry)] |
| `geometry_restore`  | `50%:50%`     | window position when PiP is disabled. Default: center [[details](https://mpv.io/manual/master/#options-geometry)]      |
| `geometry_delay`    | `0.02`        | Window position delay to avoid any racing issues                                                                       |

> [!NOTE]    
> Tested on Windows only.

### How to install

Simply place [PiP Lite](./pip_lite.lua) in the corresponding mpv scripts folder of your operating system:

- Windows: `%APPDATA%\mpv\scripts\` or `C:\users\USERNAME\AppData\Roaming\mpv\scripts\`
- Linux: `~/.config/mpv/scripts/` or `/home/USERNAME/.config/mpv/scripts/`
- Mac: `~/.config/mpv/scripts/` or `/Users/USERNAME/.config/mpv/scripts/`

```
mpv
├── script-opts
│   └── pip_lite.conf
└── scripts
    └── pip_lite.lua
```
