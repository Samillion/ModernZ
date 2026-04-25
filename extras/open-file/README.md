## Open-File
![open_file_menu](https://github.com/user-attachments/assets/5a638c25-4e65-456f-80bc-89a9dcf86041)

## Usage

This script enables you to open files, add subtitles, or add audio tracks directly from mpv via the Windows file dialog.

**Add in `input.conf`:**

The keybinds are only a suggestion; feel free to customize them to your preference.

```
Ctrl+o          script-binding open_file/open
Ctrl+Shift+s    script-binding open_file/add_subtitle
Ctrl+Shift+a    script-binding open_file/add_audio
```

**Add in `menu.conf`:**

```
&Open
	&Open File			script-binding open_file/open
	&Add Subtitle		script-binding open_file/add_subtitle
	A&dd Audio Track	script-binding open_file/add_audio
```

Examples of how to configure them can be found in the provided [`input.conf`](https://github.com/Samillion/mpv-conf/blob/master/input.conf) and [`menu.conf`](https://github.com/Samillion/mpv-conf/blob/master/menu.conf) files.

## How to install

Simply place [open-file.lua](./open-file.lua) in the mpv scripts folder:

- Windows: `%APPDATA%\mpv\scripts\` or `C:\users\USERNAME\AppData\Roaming\mpv\scripts\`

```
📁 mpv/
│   ├── 📄 input.conf
|   ├── 📄 menu.conf
│   └── 📄 mpv.conf
└── 📁 scripts/
    └── 📄 open-file.lua
```

## Note

The `open-file.lua` script is designed for Windows only. If you're using a different operating system, you can find alternatives in the [mpv user scripts](https://github.com/mpv-player/mpv/wiki/User-Scripts) or [awesome-mpv](https://github.com/stax76/awesome-mpv) collections.

- Linux (Gnome): [zenity-open-files.lua](https://github.com/alifarazz/mpv-zenity-open-files/blob/master/zenity-open-files.lua)
- Linux (KDE): [kdialog-open-files.lua](https://gist.github.com/ntasos/d1d846abd7d25e4e83a78d22ee067a22)
