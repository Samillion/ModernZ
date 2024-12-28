## Interactive Menus
ModernZ integrates mpv's [console.lua](https://github.com/mpv-player/mpv/blob/master/player/lua/console.lua) and [select.lua](https://github.com/mpv-player/mpv/blob/master/player/lua/select.lua), which have been built in mpv starting v0.39+. Can be used in:
- Playlist button
- Subtitles button
- Audio track button
- Volume control button (audio device picker)
- Chapter title (next to timestamp)

For details on how to interact with these buttons, view the [controls manual](/docs/CONTROLS.md).

https://github.com/user-attachments/assets/7f6aeaec-4057-4099-a63c-42cf2e0ab3bb

> [!TIP]
> If the font size for the interactive playlist is too small, you can add the following in your `mpv.conf`
>
> ```ini
> # change font size for console and select
> script-opts-append=console-font_size=25
> ```
