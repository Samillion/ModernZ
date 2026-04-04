# ModernZ User Options Guide

### Configuration File Location

Create `modernz.conf` in your mpv script-opts directory:

- Linux: `~/.config/mpv/script-opts/`
- Windows: `%APPDATA%/mpv/script-opts/`
- macOS: `~/Library/Application Support/mpv/script-opts/`

## Available Options

### Language and display

| Option                    | Value           | Description                                                                                                                    |
| ------------------------- | --------------- | ------------------------------------------------------------------------------------------------------------------------------ |
| language                  | default         | set language (for available options, see: [Translations](https://github.com/Samillion/ModernZ/blob/main/docs/TRANSLATIONS.md)) |
| layout                    | modern          | set layout: `"modern"` or `"modern-compact"`                                                                                   |
| icon_theme                | fluent          | set icon theme. accepts `fluent` or `material`                                                                                 |
| icon_style                | mixed           | "mixed", "filled", "outline"                                                                                                   |
| font                      | mpv-osd-symbols | font for the OSC (default: mpv-osd-symbols or the one set in mpv.conf)                                                         |
| idlescreen                | yes             | show mpv logo when idle                                                                                                        |
| window_top_bar            | auto            | show OSC window top bar: `"auto"`, `"yes"`, or `"no"` (borderless/fullscreen)                                                  |
| showwindowed              | yes             | show OSC when windowed                                                                                                         |
| showfullscreen            | yes             | show OSC when fullscreen                                                                                                       |
| showonselect              | no              | show OSC when a select menu is open                                                                                            |
| showonpause               | yes             | show OSC when paused                                                                                                           |
| keeponpause               | no              | disable OSC hide timeout when paused                                                                                           |
| greenandgrumpy            | no              | disable Santa hat in December                                                                                                  |

### OSC behaviour and scaling

| Option               | Value  | Description                                                                                                                                        |
| -------------------- | ------ | -------------------------------------------------------------------------------------------------------------------------------------------------- |
| hidetimeout          | 2000   | time (in ms) before OSC hides if no mouse movement                                                                                                 |
| keep_with_cursor     | yes    | keep OSC visible while cursor hovers over bottom or top bar                                                                                        |
| fadeduration         | 200    | fade-out duration (in ms), set to `"0"` for no fade                                                                                                |
| fadein               | no     | whether to enable fade-in effect                                                                                                                   |
| minmousemove         | 0      | minimum mouse movement (in pixels) required to show OSC                                                                                            |
| deadzonesize         | 0.75   | controls how much of the window ignores mouse movement for showing the osc; `0.0` always shows on movement, `1.0` only shows when directly hovered |
| osc_on_seek          | yes    | show OSC when seeking                                                                                                                              |
| osc_on_start         | both   | show OSC/window controls on start of every file (`no`, `bottom`, `top`, `both`)                                                                    |
| mouse_seek_pause     | yes    | pause video while seeking with mouse move (on button hold)                                                                                         |
| force_seek_tooltip   | no     | force show seekbar tooltip on mouse drag, even if not hovering seekbar                                                                             |
| vidscale             | auto   | scale osc with the video. (set to `"no"` to disable)                                                                                               |
| scalewindowed        | 1.0    | osc scale factor when windowed                                                                                                                     |
| scalefullscreen      | 1.0    | osc scale factor when fullscreen                                                                                                                   |

### Elements display

| Option                  | Value            | Description                                                                      |
| ----------------------- | ---------------- | -------------------------------------------------------------------------------- |
| show_title              | yes              | show title in the OSC (above seekbar)                                            |
| title                   | `${media-title}` | title above seekbar: `"${media-title}"` or `"${filename}"`                       |
| title_font_size         | 24               | font size of the title text (above seekbar)                                      |
| chapter_title_font_size | 14               | chapter title font size                                                          |
| show_chapter_title      | yes              | show chapter title (above seekbar)                                               |
| chapter_fmt             | %s               | format for chapter display on seekbar hover (set to `"no"` to disable)           |
| timecurrent             | yes              | show current time instead of remaining time                                      |
| timems                  | no               | show timecodes with milliseconds                                                 |
| unicodeminus            | no               | use the Unicode minus sign in remaining time                                     |
| time_format             | dynamic          | `"dynamic"` or `"fixed"`. shows MM:SS when possible, fixed always shows HH:MM:SS |
| time_font_size          | 16               | font size of the time display                                                    |
| cache_info              | no               | show cached time information                                                     |
| cache_info_speed        | no               | show current cache speed per second                                              |
| cache_info_font_size    | 12               | font size of the cache information                                               |
| tooltip_font_size       | 14               | tooltips font size                                                               |
| speed_font_size         | 16               | speed button font size                                                           |

### Title bar settings

| Option                    | Value            | Description                                                               |
| ------------------------- | ---------------- | ------------------------------------------------------------------------- |
| show_window_title         | no               | show window title in borderless/fullscreen mode                           |
| window_title_font_size    | 26               | window title font size                                                    |
| window_controls           | yes              | show window controls (close, minimize, maximize) in borderless/fullscreen |

### Subtitle and OSD display settings

**IMPORTANT**: It is recommended to add the following in your `mpv.conf`, to circumvent subtitle or OSD bad positioning when watch later options are used.

```EditorConfig
watch-later-options-remove=sub-pos
watch-later-options-remove=osd-margin-y
```

| Option          | Value | Description                                    |
| --------------- | ----- | ---------------------------------------------- |
| sub_margins     | yes   | raise subtitles above the OSC when shown       |
| osd_margins     | no    | adjust OSD to not overlap with OSC             |
| dynamic_margins | yes   | update margins dynamically with OSC visibility |

### Buttons display and functionality

| Option                     | Value         | Description                                                                                                        |
| -------------------------- | ------------- | ------------------------------------------------------------------------------------------------------------------ |
| subtitles_button           | yes           | show the subtitles menu button                                                                                     |
| audio_tracks_button        | yes           | show the audio tracks menu button                                                                                  |
| jump_buttons               | yes           | show "jump forward/backward 10 seconds" buttons                                                                    |
| jump_amount                | 10            | change the jump amount in seconds                                                                                  |
| jump_more_amount           | 60            | change the jump amount in seconds on right click                                                                   |
| jump_icon_number           | yes           | show different icon for `5`, `10`, or `30` second jumps                                                            |
| jump_mode                  | relative      | seek mode for jump buttons: `"relative"` or `"exact"`                                                              |
| jump_softrepeat            | yes           | enable continuous jumping when holding down seek buttons                                                           |
| chapter_skip_buttons       | no            | show the skip back and forward (chapter) buttons                                                                   |
| chapter_softrepeat         | yes           | enable continuous skipping when holding down chapter skip buttons                                                  |
| track_nextprev_buttons     | yes           | show next/previous playlist track buttons                                                                          |
| volume_control             | yes           | show mute button and volume slider                                                                                 |
| volume_control_type        | linear        | volume scale type: `"linear"` or `"logarithmic"`                                                                   |
| volumebar_unmute_on_click  | no            | unmute audio when adjusting volume slider with left click                                                          |
| playlist_button            | yes           | show playlist button: Left-click for simple playlist, Right-click for interactive playlist                         |
| hide_empty_playlist_button | no            | hide playlist button when no playlist exists                                                                       |
| gray_empty_playlist_button | no            | gray out the playlist button when no playlist exists                                                               |
| download_button            | yes           | show download button on web videos (requires yt-dlp and ffmpeg)                                                    |
| download_path              | ~~desktop/mpv | default download directory for videos. [Learn more about setting paths here](https://mpv.io/manual/master/#paths). |
| screenshot_button          | yes           | show screenshot button                                                                                             |
| ontop_button               | yes           | show `window on top (pin)` button                                                                                  |
| loop_button                | yes           | show `file loop` button                                                                                            |
| shuffle_button             | no            | show `shuffle` button                                                                                              |
| speed_button               | yes           | show speed control button                                                                                          |
| speed_button_click         | 1             | speed change amount per click                                                                                      |
| speed_button_scroll        | 0.25          | speed change amount on scroll                                                                                      |
| buttons_always_active      | none          | force buttons to always be active. can add: `playlist_prev`, `playlist_next`                                       |
| info_button                | yes           | show `info (stats)` button                                                                                         |
| fullscreen_button          | yes           | show `fullscreen toggle` button                                                                                    |
| playpause_size             | 28            | icon size for the play/pause button                                                                                |
| midbuttons_size            | 24            | icon size for the middle buttons                                                                                   |
| sidebuttons_size           | 24            | icon size for the side buttons                                                                                     |
| zoom_control               | yes           | show zoom controls in image viewer mode                                                                            |
| zoom_in_max                | 4             | maximum zoom in value                                                                                              |
| zoom_out_min               | -1            | minimum zoom out value                                                                                             |

### Colors and style

| Option                            | Value     | Description                                                                                       |
| --------------------------------- | --------- | ------------------------------------------------------------------------------------------------- |
| osc_color                         | `#000000` | accent color of the OSC and title bar                                                             |
| window_title_color                | `#FFFFFF` | color of the title in borderless/fullscreen mode                                                  |
| window_controls_color             | `#FFFFFF` | color of the window controls (close, minimize, maximize) in borderless/fullscreen mode            |
| windowcontrols_close_hover        | `#E81123` | color of close window control on hover                                                            |
| windowcontrols_max_hover          | `#F8BC3A` | color of maximize window controls on hover                                                        |
| windowcontrols_min_hover          | `#43CB44` | color of minimize window controls on hover                                                        |
| title_color                       | `#FFFFFF` | color of the title (above seekbar)                                                                |
| seekbarfg_color                   | `#FB8C00` | color of the seekbar progress and handle                                                          |
| seekbarbg_color                   | `#94754F` | color of the remaining seekbar                                                                    |
| seekbar_cache_color               | `#918F8E` | color of the cache ranges on the seekbar                                                          |
| volumebar_match_seek_color        | no        | match volume bar color with seekbar color (ignores `side_buttons_color`)                          |
| time_color                        | `#FFFFFF` | color of the timestamps (below seekbar)                                                           |
| chapter_title_color               | `#FFFFFF` | color of the chapter title (above seekbar)                                                        |
| cache_info_color                  | `#FFFFFF` | color of the cache information                                                                    |
| side_buttons_color                | `#FFFFFF` | color of the side buttons (audio, subtitles, playlist, etc.)                                      |
| middle_buttons_color              | `#FFFFFF` | color of the middle buttons (skip, jump, chapter, etc.)                                           |
| playpause_color                   | `#FFFFFF` | color of the play/pause button                                                                    |
| held_element_color                | `#999999` | color of the element when held down (pressed)                                                     |
| hover_effect_color                | `#FB8C00` | color of a hovered button when `hover_effect` includes `"color"`                                  |
| thumbnail_box_color               | `#111111` | color of the background for thumbnail box                                                         |
| thumbnail_box_outline             | `#404040` | color of the border outline for thumbnail box                                                     |
| nibble_color                      | `#FB8C00` | color of chapter nibbles on the seekbar                                                           |
| nibble_current_color              | `#FFFFFF` | color of the current chapter nibble on the seekbar                                                |
| osc_fade_strength                 | 100       | strength of the OSC background fade (0 to disable)                                                |
| fade_blur_strength                | 100       | blur strength for the OSC alpha fade. caution: high values can take a lot of CPU time to render   |
| fade_transparency_strength        | 0         | use with "fade_blur_strength=0" to create a transparency box                                      |
| window_fade_strength              | 100       | strength of the window title bar fade (0 to disable)                                              |
| window_fade_blur_strength         | 100       | blur strength for the window title bar. caution: high values can take a lot of CPU time to render |
| window_fade_transparency_strength | 0         | use with "window_fade_blur_strength=0" to create a transparency box                               |
| thumbnail_box_padding             | 4.5       | thumbnail box padding around the image                                                            |
| thumbnail_box_radius              | 4         | round corner radius for thumbnail box border (0 to disable)                                       |

### Button interaction settings

| Option                | Value               | Description                                                                                               |
| -------------------   | ------------------- | --------------------------------------------------------------------------------------------------------- |
| hover_effect          | size,glow,color,box | active button hover effects: `"glow"`, `"size"`, `"color"`, `"box"`; can use multiple separated by commas |
| button_hover_size     | 115                 | relative size of a hovered button if "size" effect is active                                              |
| button_held_size      | 100                 | relative size of a button when held/pressed. below 100 shrinks button when held down                      |
| button_held_box_alpha | 18                  | alpha of the hover background box when a button is held down                                              |
| button_glow_amount    | 5                   | glow intensity when `"glow"` hover effect is active                                                       |
| slider_hover_effect   | yes                 | apply size effect only when hovering slider handles                                                       |
| slider_hover_size     | 130                 | relative size of a hovered slider handle if "slider_hover_effect" is used                                 |
| tooltip_hints         | yes                 | enable tooltips for most buttons. seek and volume tooltips are always enabled                             |

### Progress bar settings

| Option                     | Value    | Description                                                             |
| -------------------------- | -------- | ----------------------------------------------------------------------- |
| seek_handle_size           | 0.8      | size ratio of the seekbar handle (range: 0 ~ 1)                         |
| seekbar_height             | medium   | seekbar height preset: `small`, `medium`, `large`, `xlarge`             |
| seekrange                  | yes      | show seek range overlay                                                 |
| seekrangealpha             | 150      | transparency of the seek range                                          |
| livemarkers                | yes      | update chapter markers on the seekbar when duration changes             |
| seekbarkeyframes           | no       | use keyframes when dragging the seekbar                                 |
| slider_rounded_corners     | yes      | rounded corners seekbar slider                                          |
| nibbles_style              | gap      | chapter nibble style: `gap`, `triangle`, `bar` or `single-bar`          |
| nibbles_top                | yes      | top chapter nibbles above seekbar                                       |
| nibbles_bottom             | yes      | bottom chapter nibbles below seekbar                                    |
| automatickeyframemode      | yes      | automatically set keyframes for the seekbar based on video length       |
| automatickeyframelimit     | 600      | videos longer than this (in seconds) will have keyframes on the seekbar |
| persistent_progress        | no       | always show a small progress line at the bottom of the screen           |
| persistent_progress_height | 17       | height of the persistent progress bar                                   |
| persistent_buffer          | no       | show cached buffer status in the persistent progress line               |

### Miscellaneous settings

| Option                        | Value             | Description                                                   |
| ----------------------------- | ----------------- | ------------------------------------------------------------- |
| visibility                    | auto              | only used at init to set visibility_mode(...)                 |
| visibility_modes              | never_auto_always | visibility modes to cycle through, modes are separated by `_` |
| tick_delay                    | 0.0167            | minimum interval between OSC redraws (in seconds)             |
| tick_delay_follow_display_fps | no                | use display FPS as the minimum redraw interval                |

### Elements Position

Useful when adjusting font size or type, this will help you change the affected elements position

| Option                      | Value | Description                                                            |
| --------------------------- | ----- | ---------------------------------------------------------------------- |
| title_offset                | 24    | title vertical offset relative to seekbar                              |
| title_with_chapter_offset   | 4     | title vertical offset if a chapter title is below it                   |
| chapter_title_offset        | 20    | chapter title vertical offset relative to seekbar                      |
| time_codes_offset           | 0     | time codes vertical offset relative to seekbar                         |
| tooltip_height_offset       | 5     | tooltip height position offset                                         |
| portrait_window_trigger     | 1000  | portrait window width trigger to move some elements                    |
| hide_volume_bar_trigger     | 1150  | hide volume bar trigger window width                                   |
| osc_height                  | 60    | osc height                                                             |

### Mouse Commands (User Options)

Customize the button function based on mouse actions.

| Type                          | Option                           | Function                                     |
| ----------------------------- | -------------------------------- | -------------------------------------------- |
| Title (above seekbar)         | title_mbtn_left_command          | `script-binding stats/display-page-5`        |
|                               | title_mbtn_mid_command           | `show-text ${path}`                          |
|                               | title_mbtn_right_command         | `script-binding select/select-watch-history` |
| Playlist button               | playlist_mbtn_left_command       | `script-binding select/select-playlist`      |
|                               | playlist_mbtn_right_command      | `script-binding select/menu`                 |
| Volume button                 | vol_ctrl_mbtn_left_command       | `no-osd cycle mute`                          |
|                               | vol_ctrl_mbtn_right_command      | `script-binding select/select-audio-device`  |
|                               | vol_ctrl_wheel_down_command      | `osd-msg add volume -5`                      |
|                               | vol_ctrl_wheel_up_command        | `osd-msg add volume 5`                       |
| Volume bar                    | volumebar_wheel_down_command     | `osd-msg add volume -5`                      |
|                               | volumebar_wheel_up_command       | `osd-msg add volume 5`                       |
| Audio button                  | audio_track_mbtn_left_command    | `script-binding select/select-aid`           |
|                               | audio_track_mbtn_mid_command     | `cycle audio down`                           |
|                               | audio_track_mbtn_right_command   | `cycle audio`                                |
|                               | audio_track_wheel_down_command   | `cycle audio`                                |
|                               | audio_track_wheel_up_command     | `cycle audio down`                           |
| Subtitle button               | sub_track_mbtn_left_command      | `script-binding select/select-sid`           |
|                               | sub_track_mbtn_mid_command       | `cycle sub down`                             |
|                               | sub_track_mbtn_right_command     | `cycle sub`                                  |
|                               | sub_track_wheel_down_command     | `cycle sub`                                  |
|                               | sub_track_wheel_up_command       | `cycle sub down`                             |
| Play/Pause button             | play_pause_mbtn_mid_command      | `cycle-values loop-playlist inf no`          |
|                               | play_pause_mbtn_right_command    | `cycle-values loop-file inf no`              |
| Chapter skip buttons          | chapter_prev_mbtn_left_command   | `add chapter -1`                             |
|                               | chapter_prev_mbtn_mid_command    | `show-text ${chapter-list} 3000`             |
|                               | chapter_prev_mbtn_right_command  | `script-binding select/select-chapter`       |
|                               | chapter_next_mbtn_left_command   | `add chapter 1`                              |
|                               | chapter_next_mbtn_mid_command    | `show-text ${chapter-list} 3000`             |
|                               | chapter_next_mbtn_right_command  | `script-binding select/select-chapter`       |
| Chapter title (below seekbar) | chapter_title_mbtn_left_command  | `script-binding select/select-chapter`       |
|                               | chapter_title_mbtn_right_command | `show-text ${chapter-list} 3000`             |
| Playlist skip Buttons         | playlist_prev_mbtn_left_command  | `playlist-prev`                              |
|                               | playlist_prev_mbtn_mid_command   | `show-text ${playlist} 3000`                 |
|                               | playlist_prev_mbtn_right_command | `script-binding select/select-playlist`      |
|                               | playlist_next_mbtn_left_command  | `playlist-next`                              |
|                               | playlist_next_mbtn_mid_command   | `show-text ${playlist} 3000`                 |
|                               | playlist_next_mbtn_right_command | `script-binding select/select-playlist`      |
| Fullscreen button             | fullscreen_mbtn_left_command     | `cycle fullscreen`                           |
|                               | fullscreen_mbtn_right_command    | `cycle window-maximized`                     |
| Info button                   | info_mbtn_left_command           | `script-binding stats/display-page-1-toggle` |
| Screenshot button             | screenshot_mbtn_left_command     | `osd-msg screenshot video`                   |

### Auto Profile

Below is an example of an auto-profile in `mpv.conf` you can use to set any of ModernZ options based on certain conditions, in this case `when window is pinned or fullscreen`.

```EditorConfig
[ModernZ-Custom]
    profile-desc=Apply ModernZ options on pin or fullscreen
    profile-cond=ontop == true or fullscreen
    profile-restore=copy-equal
    script-opts-append=modernz-persistent_progress=yes
    script-opts-append=modernz-seekbarfg_color=#FF0000
    script-opts-append=modernz-info_button=no
    #...etc
```

More information about auto profiles available on [mpv's manual](https://mpv.io/manual/master/#conditional-auto-profiles).
