## Open-File
![open_file_menu](https://github.com/user-attachments/assets/5a638c25-4e65-456f-80bc-89a9dcf86041)

This script enables you to open file dialog on Windows directly from mpv:
- Open a file
- Add a subtitle
- Add an audio track

## Usage

You can use either keybinds or the context-menu. You can see how they're added in these example [`input.conf`](https://github.com/Samillion/mpv-conf/blob/master/input.conf) and [`menu.conf`](https://github.com/Samillion/mpv-conf/blob/master/menu.conf)

In your `input.conf`:

The keybinds are just a suggestion, you can set them to whatever you prefer.

```
Ctrl+o          script-binding open_file/open
Ctrl+Shift+s    script-binding open_file/add_subtitle
Ctrl+Shift+a    script-binding open_file/add_audio
```

In your `menu.conf`:
```
&Open
	&Open File			script-binding open_file/open
	&Add Subtitle		script-binding open_file/add_subtitle
	A&dd Audio Track	script-binding open_file/add_audio
```


## How to install

Simply place [open-file.lua](./open-file.lua) in the mpv scripts folder:

- Windows: `%APPDATA%\mpv\scripts\` or `C:\users\USERNAME\AppData\Roaming\mpv\scripts\`

```
📁 mpv/
└── 📁 scripts/
    └── 📄 open-file.lua
```

## Note

The script `open-file.lua` only works for Windows, however you can search for one that works for your operating system in [mpv user scripts](https://github.com/mpv-player/mpv/wiki/User-Scripts) or [awesome-mpv](https://github.com/stax76/awesome-mpv), then apply it the same way.

- Linux (Gnome): [zenity-open-files.lua](https://github.com/alifarazz/mpv-zenity-open-files/blob/master/zenity-open-files.lua)
- Linux (KDE): [kdialog-open-files.lua](https://gist.github.com/ntasos/d1d846abd7d25e4e83a78d22ee067a22)
