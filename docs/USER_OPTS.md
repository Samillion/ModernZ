# ModernZ User Options Guide

### Configuration File Location

Create `modernz.conf` in your mpv script-opts directory:

- Linux: `~/.config/mpv/script-opts/`
- Windows: `%APPDATA%/mpv/script-opts/`
- macOS: `~/Library/Application Support/mpv/script-opts/`

## Available Options

### Language and display

| Option         | Value           | Description                                                                                                                    |
| -------------- | --------------- | ------------------------------------------------------------------------------------------------------------------------------ |
| language       | en              | set language (for available options, see: [Translations](https://github.com/Samillion/ModernZ/blob/main/docs/TRANSLATIONS.md)) |
| font           | mpv-osd-symbols | font for the OSC (default: mpv-osd-symbols or the one set in mpv.conf)                                                         |
| idlescreen     | yes             | show mpv logo when idle                                                                                                        |
| window_top_bar | auto            | show OSC window controls: `"auto"`, `"yes"`, or `"no"`                                                                         |
| showwindowed   | yes             | show OSC when windowed                                                                                                         |
| showfullscreen | yes             | show OSC when fullscreen                                                                                                       |
| showonpause    | yes             | show OSC when paused                                                                                                           |
| keeponpause    | yes             | disable OSC hide timeout when paused                                                                                           |
| greenandgrumpy | no              | disable Santa hat in December                                                                                                  |

### OSC behaviour and scaling

| Option                  | Value | Description                                                |
| ----------------------- | ----- | ---------------------------------------------------------- |
| hidetimeout             | 2000  | time (in ms) before OSC hides if no mouse movement         |
| seek_resets_hidetimeout | yes   | if seeking should reset the hidetimeout                    |
| fadeduration            | 250   | fade-out duration (in ms), set to `"0"` for no fade        |
| minmousemove            | 0     | minimum mouse movement (in pixels) required to show OSC    |
| bottomhover             | yes   | show OSC only when hovering at the bottom                  |
| bottomhover_zone        | 160   | height of hover zone for bottomhover (in pixels)           |
| osc_on_seek             | no    | show OSC when seeking                                      |
| mouse_seek_pause        | yes   | pause video while seeking with mouse move (on button hold) |
| vidscale                | auto  | scale osc with the video. (set to `"no"` to disable)       |
| scalewindowed           | 1.0   | osc scale factor when windowed                             |
| scalefullscreen         | 1.0   | osc scale factor when fullscreen                           |

### Time and title display

| Option             | Value            | Description                                                                      |
| ------------------ | ---------------- | -------------------------------------------------------------------------------- |
| show_title         | yes              | show title in the OSC (above seekbar)                                            |
| title              | `${media-title}` | title above seekbar format: `"${media-title}"` or `"${filename}"`                |
| title_font_size    | 30               | font size of the title text (above seekbar)                                      |
| show_chapter_title | yes              | show chapter title alongside timestamp (below seekbar)                           |
| chapter_fmt        | %s               | format for chapter display on seekbar hover (set to `"no"` to disable)           |
| timetotal          | yes              | show total time instead of remaining time                                        |
| timems             | no               | show timecodes with milliseconds                                                 |
| unicodeminus       | no               | use the Unicode minus sign in remaining time                                     |
| time_format        | dynamic          | `"dynamic"` or `"fixed"`. shows MM:SS when possible, fixed always shows HH:MM:SS |
| time_font_size     | 18               | font size of the time display                                                    |

### Title bar settings

| Option               | Value            | Description                                                               |
| -------------------- | ---------------- | ------------------------------------------------------------------------- |
| window_title         | no               | show window title in borderless/fullscreen mode                           |
| window_controls      | yes              | show window controls (close, minimize, maximize) in borderless/fullscreen |
| title_bar_box        | no               | show title bar as a box instead of a black fade                           |
| windowcontrols_title | `${media-title}` | same as title but for window_top_bar                                      |

### Subtitle display settings

| Option                | Value | Description                                                            |
| --------------------- | ----- | ---------------------------------------------------------------------- |
| raise_subtitles       | yes   | raise subtitles above the OSC when shown                               |
| raise_subtitle_amount | 175   | amount by which subtitles are raised when the OSC is shown (in pixels) |

### Buttons display and functionality

| Option                     | Value         | Description                                                                                                                                                                                            |
| -------------------------- | ------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| jump_buttons               | yes           | show "jump forward/backward 10 seconds" buttons                                                                                                                                                        |
| jump_amount                | 10            | change the jump amount in seconds                                                                                                                                                                      |
| jump_more_amount           | 60            | change the jump amount in seconds when right-clicking jump buttons and shift-clicking chapter skip buttons                                                                                             |
| jump_icon_number           | yes           | show different icon for `5`, `10`, or `30` second jumps                                                                                                                                                |
| jump_mode                  | relative      | seek mode for jump buttons                                                                                                                                                                             |
| jump_softrepeat            | yes           | enable continuous jumping when holding down seek buttons                                                                                                                                               |
| chapter_skip_buttons       | no            | show the skip back and forward (chapter) buttons                                                                                                                                                       |
| chapter_softrepeat         | yes           | enable continuous skipping when holding down chapter skip buttons                                                                                                                                      |
| track_nextprev_buttons     | yes           | show next/previous playlist track buttons                                                                                                                                                              |
| volume_control             | yes           | show mute button and volume slider                                                                                                                                                                     |
| volume_control_type        | linear        | volume scale type: `"linear"` or `"logarithmic"`                                                                                                                                                       |
| playlist_button            | no            | show playlist button: Left-click for simple playlist, Right-click for interactive playlist                                                                                                             |
| hide_empty_playlist_button | yes           | hide playlist button when no playlist exists                                                                                                                                                           |
| gray_empty_playlist_button | yes           | gray out the playlist button when no playlist exists                                                                                                                                                   |
| download_button            | yes           | show download button on web videos (requires yt-dlp and ffmpeg)                                                                                                                                        |
| download_path              | ~~desktop/mpv | default download directory for videos. [Learn more about setting paths here](https://mpv.io/manual/master/#paths).                                                                                     |
| screenshot_button          | no            | show screenshot button                                                                                                                                                                                 |
| screenshot_flag            | subtitles     | Flag options for the screenshot button: `"subtitles"`, `"video"`, `"window"`, `"each-frame"`. [Find out more about these options](https://mpv.io/manual/master/#command-interface-screenshot-<flags>). |
| ontop_button               | yes           | show `window on top (pin)` button                                                                                                                                                                      |
| loop_button                | no            | show `loop` button                                                                                                                                                                                     |
| speed_button               | no            | show speed control button                                                                                                                                                                              |
| loop_in_pause              | yes           | enable looping by right-clicking pause                                                                                                                                                                 |
| info_button                | no            | show `info (stats)` button                                                                                                                                                                             |
| fullscreen_button          | yes           | show `fullscreen toggle` button                                                                                                                                                                        |
| playpause_size             | 30            | icon size for the play/pause button                                                                                                                                                                    |
| midbuttons_size            | 24            | icon size for the middle buttons                                                                                                                                                                       |
| sidebuttons_size           | 24            | icon size for the side buttons                                                                                                                                                                         |
| zoom_control               | yes           | show zoom controls in image viewer mode                                                                                                                                                                |
| zoom_in_max                | 4             | icon size for the side buttons                                                                                                                                                                         |
| zoom_out_min               | -1            | icon size for the side buttons                                                                                                                                                                         |


### Colors and style

| Option                      | Value     | Description                                                                                     |
| --------------------------- | --------- | ----------------------------------------------------------------------------------------------- |
| osc_color                   | `#000000` | accent color of the OSC and title bar                                                           |
| window_title_color          | `#FFFFFF` | color of the title in borderless/fullscreen mode                                                |
| window_controls_color       | `#FFFFFF` | color of the window controls (close, minimize, maximize) in borderless/fullscreen mode          |
| windowcontrols_close_hover  | `#E81123` | color of close window control on hover                                                          |
| windowcontrols_minmax_hover | `#FFD700` | color of min/max window controls on hover                                                       |
| title_color                 | `#FFFFFF` | color of the title (above seekbar)                                                              |
| seekbarfg_color             | `#BE4D25` | color of the seekbar progress and handle                                                        |
| seekbarbg_color             | `#FFFFFF` | color of the remaining seekbar                                                                  |
| seekbar_cache_color         | `#BE254A` | color of the cache ranges on the seekbar                                                        |
| volumebar_match_seek_color  | no        | match volume bar color with seekbar color (ignores `side_buttons_color`)                        |
| time_color                  | `#FFFFFF` | color of the timestamps (below seekbar)                                                         |
| chapter_title_color         | `#FFFFFF` | color of the chapter title next to timestamp (below seekbar)                                    |
| side_buttons_color          | `#FFFFFF` | color of the side buttons (audio, subtitles, playlist, etc.)                                    |
| middle_buttons_color        | `#FFFFFF` | color of the middle buttons (skip, jump, chapter, etc.)                                         |
| playpause_color             | `#FFFFFF` | color of the play/pause button                                                                  |
| held_element_color          | `#999999` | color of the element when held down (pressed)                                                   |
| hover_effect_color          | `#FFFFFF` | color of a hovered button when `hover_effect` includes `"color"`                                |
| thumbnail_border_color      | `#111111` | color of the border for thumbnails (with thumbfast)                                             |
| fade_alpha                  | 150       | alpha of the OSC background box                                                                 |
| fade_blur_strength          | 100       | blur strength for the OSC alpha fade. caution: high values can take a lot of CPU time to render |
| window_fade_alpha           | 75        | alpha of the window title bar                                                                   |
| thumbnail_border            | 2         | width of the thumbnail border (for thumbfast)                                                   |

### Button hover effects

| Option                   | Value           | Description                                                                                      |
| ------------------------ | --------------- | ------------------------------------------------------------------------------------------------ |
| hover_effect             | size,glow,color | active button hover effects: `"glow"`, `"size"`, `"color"`; can use multiple separated by commas |
| hover_button_size        | 115             | relative size of a hovered button if "size" effect is active                                     |
| button_glow_amount       | 5               | glow intensity when `"glow"` hover effect is active                                              |
| hover_effect_for_sliders | no              | apply hover effects to slider handles                                                            |

### Tooltips and hints

| Option                         | Value | Description                                                     |
| ------------------------------ | ----- | --------------------------------------------------------------- |
| tooltips_for_disabled_elements | yes   | enable tooltips for disabled buttons and elements               |
| tooltip_hints                  | yes   | enable text hints for info, loop, ontop, and screenshot buttons |

### Progress bar settings

| Option                   | Value | Description                                                             |
| ------------------------ | ----- | ----------------------------------------------------------------------- |
| seekbarhandlesize        | 0.8   | size ratio of the seekbar handle (range: 0 ~ 1)                         |
| seekrange                | yes   | show seek range overlay                                                 |
| seekrangealpha           | 150   | transparency of the seek range                                          |
| livemarkers              | yes   | update chapter markers on the seekbar when duration changes             |
| seekbarkeyframes         | no    | use keyframes when dragging the seekbar                                 |
| automatickeyframemode    | yes   | automatically set keyframes for the seekbar based on video length       |
| automatickeyframelimit   | 600   | videos longer than this (in seconds) will have keyframes on the seekbar |
| persistentprogress       | no    | always show a small progress line at the bottom of the screen           |
| persistentprogressheight | 17    | height of the persistent progress bar                                   |
| persistentbuffer         | no    | show buffer status on web videos in the persistent progress line        |

### Miscellaneous settings

| Option                        | Value  | Description                                       |
| ----------------------------- | ------ | ------------------------------------------------- |
| visibility                    | auto   | only used at init to set visibility_mode(...)     |
| tick_delay                    | 0.03   | minimum interval between OSC redraws (in seconds) |
| tick_delay_follow_display_fps | no     | use display FPS as the minimum redraw interval    |

### Mouse Commands (User Options)

Customize the button function based on mouse actions.

| Type                          | Option                           | Function                                                                        |
| ----------------------------- | -------------------------------- | ------------------------------------------------------------------------------- |
| Title (above seekbar)         | title_mbtn_left_command          | `script-binding select/select-playlist; script-message-to modernz osc-hide`     |
|                               | title_mbtn_right_command         | `script-binding stats/display-page-5`                                           |
| Playlist Button               | playlist_mbtn_left_command       | `script-binding select/select-playlist; script-message-to modernz osc-hide`     |
|                               | playlist_mbtn_right_command      | `show-text ${playlist} 3000`                                                    |
| Volume Control                | vol_ctrl_mbtn_right_command      | `script-binding select/select-audio-device; script-message-to modernz osc-hide` |
| Audio Button                  | audio_track_mbtn_left_command    | `script-binding select/select-aid; script-message-to modernz osc-hide`          |
|                               | audio_track_mbtn_right_command   | `cycle audio`                                                                   |
|                               | audio_track_wheel_down_command   | `cycle audio`                                                                   |
|                               | audio_track_wheel_up_command     | `cycle audio down`                                                              |
| Subtitle Button               | sub_track_mbtn_left_command      | `script-binding select/select-sid; script-message-to modernz osc-hide`          |
|                               | sub_track_mbtn_right_command     | `cycle sub`                                                                     |
|                               | sub_track_wheel_down_command     | `cycle sub`                                                                     |
|                               | sub_track_wheel_up_command       | `cycle sub down`                                                                |
| Chapter Skip Buttons          | chapter_prev_mbtn_left_command   | `no-osd add chapter -1`                                                         |
|                               | chapter_prev_mbtn_right_command  | `script-binding select/select-chapter; script-message-to modernz osc-hide`      |
|                               | chapter_next_mbtn_left_command   | `no-osd add chapter 1`                                                          |
|                               | chapter_next_mbtn_right_command  | `script-binding select/select-chapter; script-message-to modernz osc-hide`      |
| Chapter Title (below seekbar) | chapter_title_mbtn_left_command  | `script-binding select/select-chapter; script-message-to modernz osc-hide`      |
|                               | chapter_title_mbtn_right_command | `show-text ${chapter-list} 3000`                                                |

### Auto Profile

Below is an example of an auto-profile in `mpv.conf` you can use to set any of ModernZ options based on certain conditions, in this case `when window is pinned or fullscreen`.

```ini
[ModernZ-Custom]
    profile-desc=Apply ModernZ options on pin or fullscreen
    profile-cond=ontop and ontop == true or fullscreen
    profile-restore=copy-equal
    script-opts-append=modernz-persistentprogress=yes
    script-opts-append=modernz-seekbarfg_color=#FF0000
    script-opts-append=modernz-bottomhover=no
    #...etc
```

More information about auto profiles available on [mpv's manual](https://mpv.io/manual/master/#conditional-auto-profiles).
