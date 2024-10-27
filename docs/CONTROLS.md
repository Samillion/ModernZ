# ModernZ Controls Guide

## Button Interactions

Below is a list that explains the OSC buttons function depending on how you interact with them.

> [!NOTE]
> Middle clicking performs the same function as `Shift+left mouse button`, allowing for one handed use

### Title

| Action            | Function                  |
| ----------------- | ------------------------- |
| Left mouse click  | Show `media-title` in OSD |
| Right mouse click | Show `filename` in OSD    |

### Seekbar

| Action                 | Function                           |
| ---------------------- | ---------------------------------- |
| Left mouse click       | Seek to position (using keyframes) |
| Shift+left mouse click | Seek to the exact position         |
| Right mouse click      | Seek to the head of chosen chapter |
| Scroll wheel           | Seek forward/backwards             |

### Playback Time

| Action           | Function                     |
| ---------------- | ---------------------------- |
| Left mouse click | Display time in milliseconds |

### Duration

| Action           | Function                                     |
| ---------------- | -------------------------------------------- |
| Left mouse click | Display remaining time instead of total time |

### Play/Pause

| Action            | Function                   |
| ----------------- | -------------------------- |
| Left mouse click  | Toggle play/pause          |
| Right mouse click | Toggle enable/disable loop |

### Playlist Track Back/Forward

| Action                 | Function                |
| ---------------------- | ----------------------- |
| Left mouse click       | Play previous/next file |
| Right mouse click      | Show a simple playlist  |
| Shift+left mouse click | Show a simple playlist  |

### Skip Chapter Back/Forward

| Action                  | Function                              |
| ----------------------- | ------------------------------------- |
| Left mouse click        | Go to previous/next chapter           |
| Right mouse click       | Show an interactive chapters list     |
| Shift+left mouse click  | Jump forwards/backwards by 60 seconds |
| Shift+right mouse click | Show a simple chapters list           |

### Jump Back/Forward

| Action                 | Function                                                                |
| ---------------------- | ----------------------------------------------------------------------- |
| Left mouse click       | Jumps forwards/backwards by 10 seconds (or by `user_opts` `jumpamount`) |
| Right mouse click      | Jumps forwards/backwards by 1 minute                                    |
| Shift+left mouse click | Skips to the previous/next frame (and pauses)                           |

### Audio/Subtitle

| Action                 | Function                            |
| ---------------------- | ----------------------------------- |
| Left mouse click       | Show an interactive tracks list     |
| Right mouse click      | Cycle audio/subtitle track          |
| Shift+left mouse click | Show a simple tracks list           |
| Scroll wheel           | Cycle audio/subtitle tracks up/down |

### Playlist

| Action            | Function                     |
| ----------------- | ---------------------------- |
| Left mouse click  | Show an interactive playlist |
| Right mouse click | Show a simple playlist       |

### Screenshot

| Action           | Function          |
| ---------------- | ----------------- |
| Left mouse click | Take a screenshot |

### Pin

| Action            | Function                               |
| ----------------- | -------------------------------------- |
| Left mouse click  | Toggle pin and toggle window border    |
| Right mouse click | Toggle pin without changing the border |

### Volume

| Action           | Function              |
| ---------------- | --------------------- |
| Left mouse click | Toggle mute on/off    |
| Scroll wheel     | Change volume up/down |

## Keybinds

| Function            | Input Command                                      | Description                                                              |
| ------------------- | -------------------------------------------------- | ------------------------------------------------------------------------ |
| Persistent Progress | `w script-binding modernz/progress-toggle`         | Toggle persistent progress bar                                           |
| Show OSC            | `x script-message-to modernz osc-show`             | Show OSC on command without needing to move mouse                        |
| OSC Visibility      | `y script-message-to modernz osc-visibility cycle` | OSC visibility mode. Accepts `never`, `auto`, `always` and `cycle`       |
| Logo on Idle        | `z script-message-to modernz osc-idlescreen cycle` | The visibility of the mpv logo on idle. Accepts `yes`, `no`, and `cycle` |

### Auto Profile

This is an example of an auto-profile in `mpv.conf` you can use to set persistent progress bar based on conditions automatically.

```ini
[Persistent-Bar]
    profile-desc=Enable persistent bar on window pin or fullscreen
    profile-cond=ontop and ontop == true or fullscreen
    profile-restore=copy-equal
    input-commands=script-message-to modernz persistent-progress yes

[Persistent-Bar-Off]
    profile-desc=Disable persistent bar when not pinned or not fullscreen
    profile-cond=not ontop or ontop == false or not fullscreen
    profile-restore=copy-equal
    input-commands=script-message-to modernz persistent-progress no
```
