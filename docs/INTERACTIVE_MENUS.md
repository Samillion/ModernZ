## Interactive Menus
ModernZ integrates mpv's [console.lua](https://github.com/mpv-player/mpv/blob/master/player/lua/console.lua) and [select.lua](https://github.com/mpv-player/mpv/blob/master/player/lua/select.lua), which have been built in mpv starting v0.39+. Can be used in:
- Playlist button
- Subtitles button
- Audio track button
- Volume control button (audio device selector) [right mouse button]
- Chapter title

For details on how to interact with these buttons, view the [controls manual](/docs/CONTROLS.md).

https://github.com/user-attachments/assets/2aa1da68-abfa-4229-9795-b4c109e9d99d

## Notes
> [!IMPORTANT]
> If the menus are not functioning as shown in the video, it is most likely because you're using an outdated version of mpv

- Check [mpv installation sources](https://mpv.io/installation/) on the official website for up-to-date packages
- Use [mpv-build](https://github.com/mpv-player/mpv-build) to get the latest release
- Use a simplified alternative function as shown below until you're able to update mpv

#### Alternative function:
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
