## Interactive Menus

https://github.com/user-attachments/assets/455c9eff-d8c7-4aed-bda3-1896b64ac667

ModernZ integrates mpv’s built-in [`console.lua`](https://github.com/mpv-player/mpv/blob/master/player/lua/console.lua) and [`select.lua`](https://github.com/mpv-player/mpv/blob/master/player/lua/select.lua) scripts, available in mpv starting from **v0.39+**.

These integrations are accessible through the following interface elements:

- **Playlist** button (right and left click)
- **Subtitles** button
- **Audio Track** button
- **Chapter Title** (opens the chapters list)
- **Volume Control** button — right-click to open the audio device selector

For detailed information on how to interact with these controls, please refer to the [Controls Manual](/docs/CONTROLS.md).

## Context Menu
For the best experience, make sure you’re running the latest version of mpv (git/master) to take advantage of all recently added features, especially when using the `modern-compact` layout.

Because the new layout is more compact, additional options remain easily accessible via: (thanks to @guidocella)

- Right-click the **Playlist** button (Menu)
- Open the new **Context Menu**

![modernz-menu-context](https://github.com/user-attachments/assets/b345c64b-3a9e-4885-9340-0d224a43e40d)

To enable context-menu:
- Bind context menu in your `input.conf`
  - Example: `MBTN_RIGHT  script-binding select/context-menu`
- Optional: To adjust the context menu, you can use the default [menu.conf](https://github.com/mpv-player/mpv/blob/master/etc/menu.conf) as a reference
  - Place your modified `menu.conf` in your mpv config folder, same location as `mpv.conf`
  - As an example, here is a modified [menu.conf](https://github.com/Samillion/mpv-conf/blob/master/menu.conf)

Additionally, to not use native Windows context-menu, you can add `load-context-menu=yes` to your `mpv.conf`.

### Open File Dialog (Optional)
The solution below only works for Windows, however you can search for one that works for your operating system in [mpv user scripts](https://github.com/mpv-player/mpv/wiki/User-Scripts) or [awesome-mpv](https://github.com/stax76/awesome-mpv), then apply it the same way.

<img width="1740" height="832" alt="image" src="https://github.com/user-attachments/assets/5f27079d-ceab-4aa2-90ca-36f1194a850a" />

To be able to open a file directly from mpv, you can use [open-file.lua](https://github.com/Samillion/mpv-conf/blob/master/scripts/open-file.lua) script.

In your `input.conf`, add:
```
Ctrl+o script-binding open_file/open
```

In your `menu.conf`, add:
```
&Open File	script-binding open_file/open
```

You can see how that's done by viewing this [input.conf](https://github.com/Samillion/mpv-conf/blob/master/input.conf) and this [menu.conf](https://github.com/Samillion/mpv-conf/blob/master/menu.conf).

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
