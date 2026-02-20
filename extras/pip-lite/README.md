## PiP Lite (Picture-in-Picture)
This script adds a PiP mode when pin (ontop) is enabled, which also enhances the pin button on ModernZ turning it into a PiP button.

When pin is enabled, window is resized and moved to bottom right. All fit and window positions can be adjusted in `pip_lite.conf`.

https://github.com/user-attachments/assets/942790a6-49a5-4dc0-8b5c-0e8fc375f3b1

## Options
To adjust them you can either: 
- Place [pip_lite.conf](./pip_lite.conf) in `script-opts` and change the values in it [recommended]
- Simply change their values in `local options` within the script itself

| Option              | Value         | Description                                                                                                            |
|---------------------|---------------|------------------------------------------------------------------------------------------------------------------------|
| `autofit`           | `40%x30%`     | [autofit](https://mpv.io/manual/master/#options-autofit) (window size) option when pip is enabled                      |
| `autofit_larger`    | `40%x30%`     | [autofit-larger](https://mpv.io/manual/master/#options-autofit-larger) (window size) option when pip is enabled        |
| `geometry`          | `100%:100%`   | window position when PiP is enabled. default: bottom-right [[details](https://mpv.io/manual/master/#options-geometry)] |
| `geometry_restore`  | `50%:50%`     | window position when PiP is disabled. default: center [[details](https://mpv.io/manual/master/#options-geometry)]      |
| `geometry_delay`    | `0.02`        | window position delay (in seconds) to avoid any racing issues                                                          |

You can easily control other ModernZ or mpv options when PiP is enabled by using an auto-profile, for example:

```EditorConfig
[Window-PiP]
    profile-desc=Custom options for PiP mode
    profile-cond=ontop == true and not fullscreen
    profile-restore=copy-equal
    script-opts-append=modernz-persistentprogress=yes
```

## How to install

Simply place [pip_lite.lua](./pip_lite.lua) in the corresponding mpv scripts folder of your operating system:

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

> [!NOTE]    
> Tested on Windows only
> 
> If you test on other platforms, please let us know how it went and what could be done
