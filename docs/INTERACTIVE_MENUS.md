## Interactive Menus
https://github.com/user-attachments/assets/d8dc8ea4-3d03-40f5-9015-f81a44371711

ModernZ integrates mpv's [console.lua](https://github.com/mpv-player/mpv/blob/master/player/lua/console.lua) and [select.lua](https://github.com/mpv-player/mpv/blob/master/player/lua/select.lua), which have been built in mpv starting v0.39+. Can be used in:
- Playlist button
- Subtitles button
- Audio track button
- Chapter title (chapters list)
- Volume control button (audio device selector) [right mouse button]

For details on how to interact with these buttons, view the [controls manual](/docs/CONTROLS.md).

## Context Menu
Make sure to update your mpv to latest (git/master) so you can enjoy all the new features that have been added. Especially useful alongside the new `modern-compact` layout. 

As the new layout is compact, you can still access additional options by either right clicking on the `playlist button` or using the new `context menu` (thanks to guidocella) as shown in the following preview respectively, left to right.

![modernz-menu-context](https://github.com/user-attachments/assets/e59afaaa-f869-4768-b23e-0ed3424d67f0)

To enable context-menu:
- Add `load-context-menu=yes` to your `mpv.conf`
- Bind mouse right click to context menu in your `input.conf`
  - Example: `MBTN_RIGHT  script-binding select/context-menu`
- Optional: To adjust the context menu, you can use the default [menu.conf](https://github.com/mpv-player/mpv/blob/master/etc/menu.conf) as a reference
  - Place your modified `menu.conf` in your mpv config folder, same location as `mpv.conf`
  - As an example, here is a modified [menu.conf](https://github.com/Samillion/mpv-conf/blob/master/menu.conf)

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
