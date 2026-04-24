## Open-File

<img width="2035" height="1145" alt="open-file" src="https://github.com/user-attachments/assets/5e0c360c-77d2-4844-8bcc-280eaa8a4bf4" /><br>
This script allows you to open file dialog on Windows directly from mpv:
- Open a file
- Add a subtitle
- Add an audio track

## Usage

You can use either keybinds or the context-menu.

In your `input.conf`, add:

The keybinds are just a suggestion, you can set them to whatever you desire.

```
Ctrl+o          script-binding open_file/open
Ctrl+Shift+s    script-binding open_file/add_subtitle
Ctrl+Shift+a    script-binding open_file/add_audio
```

In your `menu.conf`, add:
```
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

## Linux & Mac

The script `open-file.lua` only works for Windows, however you can search for one that works for your operating system in [mpv user scripts](https://github.com/mpv-player/mpv/wiki/User-Scripts) or [awesome-mpv](https://github.com/stax76/awesome-mpv), then apply it the same way.

- Linux (Gnome): [zenity-open-files.lua](https://github.com/alifarazz/mpv-zenity-open-files/blob/master/zenity-open-files.lua)
- Linux (KDE): [kdialog-open-files.lua](https://gist.github.com/ntasos/d1d846abd7d25e4e83a78d22ee067a22)
