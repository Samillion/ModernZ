## Interactive Menus

https://github.com/user-attachments/assets/43b92663-d69a-4549-87cd-e60cff89d395

ModernZ integrates mpv’s built-in [`console.lua`](https://github.com/mpv-player/mpv/blob/master/player/lua/console.lua) and [`select.lua`](https://github.com/mpv-player/mpv/blob/master/player/lua/select.lua) scripts, available in mpv starting from **v0.39+**.

These integrations are accessible through the following interface elements:

- **Playlist** button (right and left click)
- **Subtitles** button
- **Audio Track** button
- **Chapter Title** (opens the chapters list)
- **Volume Control** button — right-click to open the audio device selector

For detailed information on how to interact with these controls, please refer to the [Controls Manual](/docs/CONTROLS.md).

## Context Menu
For the best experience, make sure you’re running the latest version of mpv (git/master) to take advantage of all recently added features.

<img width="985" height="587" alt="modernz-menu" src="https://github.com/user-attachments/assets/33131b6c-5e56-4f64-bb9a-e6d91e1bbf06" />

To enable context-menu:
- Bind context menu in your `input.conf`
  - Example: `MBTN_RIGHT  script-binding select/context-menu`
- Optional: To adjust the context menu, you can use the default [menu.conf](https://github.com/mpv-player/mpv/blob/master/etc/menu.conf) as a reference
  - Place your modified `menu.conf` in your mpv config folder, same location as `mpv.conf`
  - As an example, here is a modified [menu.conf](https://github.com/Samillion/mpv-conf/blob/master/menu.conf)
  - To not use native OS context-menu, you can add `load-context-menu=yes` to your `mpv.conf`.

#### Context menu list for ModernZ in `menu.conf`:

You can add or remove any of the list items to suit your needs. [[full list of ModernZ options](/docs/USER_OPTS.md)]

```

&ModernZ
	&Layout
		&Modern				no-osd change-list script-opts append modernz-layout=modern
		Modern &Compact		no-osd change-list script-opts append modernz-layout=modern-compact

	&Theme
		&Icon Theme
            &Fluent		no-osd change-list script-opts append modernz-icon_theme=fluent
            &Material	no-osd change-list script-opts append modernz-icon_theme=material
		Icon &Style
            &Mixed		no-osd change-list script-opts append modernz-icon_style=mixed
            &Filled		no-osd change-list script-opts append modernz-icon_style=filled
            &Outline	no-osd change-list script-opts append modernz-icon_style=outline

	&Seekbar
        &Persistent Progress	script-binding modernz/progress-toggle
        &Seekbar Height
            &small		no-osd change-list script-opts append modernz-seekbar_height=small
            &medium		no-osd change-list script-opts append modernz-seekbar_height=medium
            &large		no-osd change-list script-opts append modernz-seekbar_height=large
            &xlarge		no-osd change-list script-opts append modernz-seekbar_height=xlarge
        &Chapter Marker
            &gap			no-osd change-list script-opts append modernz-nibbles_style=gap
            &triangle		no-osd change-list script-opts append modernz-nibbles_style=triangle
            &bar			no-osd change-list script-opts append modernz-nibbles_style=bar
            &single-bar		no-osd change-list script-opts append modernz-nibbles_style=single-bar

	&Cycle OSC visibility	script-binding modernz/visibility

	L&anguage
		Defa&ult				no-osd change-list script-opts append modernz-language=default
		&Arabic					no-osd change-list script-opts append modernz-language=ar
		&Danish					no-osd change-list script-opts append modernz-language=dk
		&English				no-osd change-list script-opts append modernz-language=en
		&French					no-osd change-list script-opts append modernz-language=fr
		&German					no-osd change-list script-opts append modernz-language=de
		&Icelandic				no-osd change-list script-opts append modernz-language=is
		&Japanese				no-osd change-list script-opts append modernz-language=jp
		&Polish					no-osd change-list script-opts append modernz-language=pl
		&Russian				no-osd change-list script-opts append modernz-language=ru
		&Spanish				no-osd change-list script-opts append modernz-language=es
		Simplified &Chinese		no-osd change-list script-opts append modernz-language=zh

```

### Open File Dialog (Optional)

<img width="2023" height="1123" alt="open-file" src="https://github.com/user-attachments/assets/3b4ffa5f-05bb-420f-99d5-33d8abf2b9e4" /><br>

To be able to open a file or add a subtitle directly from mpv, you can use [open-file.lua](https://github.com/Samillion/mpv-conf/blob/master/scripts/open-file.lua) script.

In your `input.conf`, add:
```
Ctrl+o          script-binding open_file/open
Ctrl+Shift+s    script-binding open_file/add_subtitle
```

In your `menu.conf`, add:
```
&Open File		script-binding open_file/open
&Add Subtitle	script-binding open_file/add_subtitle
```

You can see how that's done by viewing this [input.conf](https://github.com/Samillion/mpv-conf/blob/master/input.conf) and this [menu.conf](https://github.com/Samillion/mpv-conf/blob/master/menu.conf).

The script `open-file.lua` only works for Windows, however you can search for one that works for your operating system in [mpv user scripts](https://github.com/mpv-player/mpv/wiki/User-Scripts) or [awesome-mpv](https://github.com/stax76/awesome-mpv), then apply it the same way.

- Linux (Gnome): [zenity-open-files.lua](https://github.com/alifarazz/mpv-zenity-open-files/blob/master/zenity-open-files.lua)
- Linux (KDE): [kdialog-open-files.lua](https://gist.github.com/ntasos/d1d846abd7d25e4e83a78d22ee067a22)

## Notes
> [!IMPORTANT]
> If the menus are not functioning as shown in the video, it is most likely because you're using an outdated version of mpv

- Check [mpv installation sources](https://mpv.io/installation/) on the official website for up-to-date packages
- Use [mpv-build](https://github.com/mpv-player/mpv-build) to get the latest release
- Use a simplified alternative function as shown below until you're able to update mpv

#### Alternative function: (for outdated mpv)
You can add the following to `modernz.conf` in your `script-opts` folder to at least get some functionality until you update mpv

```EditorConfig
title_mbtn_left_command=show-text ${filename}
playlist_mbtn_left_command=show-text ${playlist} 3000
audio_track_mbtn_left_command=cycle audio
sub_track_mbtn_left_command=cycle sub
chapter_title_mbtn_left_command=show-text ${chapter-list} 3000
```

> [!TIP]
> If the font size for the interactive playlist is too small, you can add the following in your `mpv.conf`
>
> ```ini
> # change font size for console and select
> script-opts-append=console-font_size=25
> ```
