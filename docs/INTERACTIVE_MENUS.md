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

### Open File (Optional)

<img width="2035" height="1145" alt="open-file" src="https://github.com/user-attachments/assets/5e0c360c-77d2-4844-8bcc-280eaa8a4bf4" /><br>
[open-file.lua](/extras/open-file) script allows you to open file dialog on Windows directly from mpv:
- Open a file
- Add a subtitle
- Add an audio track



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
