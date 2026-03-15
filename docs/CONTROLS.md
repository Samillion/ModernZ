# ModernZ Controls Guide
<img width="1717" height="120" alt="modernz_buttons" src="https://github.com/user-attachments/assets/81a983f6-6300-4c3f-9ebd-876bca86cc5e" />

## Button Interactions

Below is a list that explains the OSC buttons function depending on how you interact with them.

> [!NOTE]
> Middle clicking performs the same function as `Shift+left mouse button`, allowing for one handed use

### Title

| Action            | Function                     |
| ----------------- | ---------------------------- |
| Left mouse click  | Show current track details   |
| Right mouse click | Show menu with watch history |

### Seekbar

| Action                 | Function                           |
| ---------------------- | ---------------------------------- |
| Left mouse click       | Seek to position (using keyframes) |
| Middle mouse click     | Seek to the exact position         |
| Shift+left mouse click | Seek to the exact position         |
| Right mouse click      | Seek to the head of chosen chapter |
| Scroll wheel           | Seek forward/backwards             |

### Time Codes

| Action            | Function                                       |
| ----------------- | --------------------------------------------   |
| Left mouse click  | Display remaining time instead of current time |
| Right mouse click | Display time in milliseconds                   |

### Play/Pause

| Action                 | Function                            |
| ---------------------- | ----------------------------------- |
| Left mouse click       | Toggle play/pause                   |
| Right mouse click      | Toggle enable/disable file loop     |
| Middle mouse click     | Toggle enable/disable playlist loop |
| Shift+left mouse click | Toggle enable/disable playlist loop |

### Track Back/Forward

| Action                 | Function                |
| ---------------------- | ----------------------- |
| Left mouse click       | Play previous/next file |
| Right mouse click      | Show a playlist menu    |
| Shift+left mouse click | Show a simple playlist  |
| Middle mouse click     | Show a simple playlist  |

### Skip Chapter Back/Forward

| Action                  | Function                              |
| ----------------------- | ------------------------------------- |
| Left mouse click        | Go to previous/next chapter           |
| Right mouse click       | Show an interactive chapters list     |
| Shift+left mouse click  | Show a simple chapters list           |

### Jump Back/Forward

| Action                 | Function                                                                |
| ---------------------- | ----------------------------------------------------------------------- |
| Left mouse click       | Jumps forwards/backwards by 10 seconds (or by `user_opts` `jumpamount`) |
| Right mouse click      | Jumps forwards/backwards by 1 minute                                    |
| Shift+left mouse click | Skips to the previous/next frame (and pauses)                           |
| Middle mouse click     | Skips to the previous/next frame (and pauses)                           |

### Audio/Subtitle

| Action                 | Function                            |
| ---------------------- | ----------------------------------- |
| Left mouse click       | Show an interactive tracks list     |
| Right mouse click      | Cycle audio/subtitle track          |
| Shift+left mouse click | Cycle audio/subtitle track down     |
| Scroll wheel           | Cycle audio/subtitle tracks up/down |

### Playlist

| Action            | Function                     |
| ----------------- | ---------------------------- |
| Left mouse click  | Show an interactive playlist |
| Right mouse click | Show an interactive menu     |

### Volume

| Action            | Function                      |
| ----------------- | ----------------------------- |
| Left mouse click  | Toggle mute on/off            |
| Right mouse click | Show audio device select menu |
| Scroll wheel      | Change volume up/down         |

### Screenshot

| Action           | Function          |
| ---------------- | ----------------- |
| Left mouse click | Take a screenshot |

### Pin

| Action            | Function                               |
| ----------------- | -------------------------------------- |
| Left mouse click  | Toggle stay-on-top                     |

### Loop

| Action            | Function             |
| ----------------- | -------------------- |
| Left mouse click  | Toggle loop on/off   |

### Shuffle

| Action            | Function                     |
| ----------------- | ---------------------------- |
| Left mouse click  | Shuffle/Unshuffle playlist   |

### Speed Control

| Action                 | Function                                  |
| ---------------------- | ----------------------------------------- |
| Left mouse click       | Increase playing speed by increments of 1 |
| Right mouse click      | Reset playing speed to normal             |
| Scroll wheel           | Inc/decrease playing speed by 0.25        |

### Download

| Action            | Function                             |
| ----------------- | ------------------------------------ |
| Left mouse click  | Download the current video/image URL |

## Keybinds

| Function             | Input Command                                      | Description                                                              |
| -------------------- | -------------------------------------------------- | ------------------------------------------------------------------------ |
| Persistent Progress  | `w script-binding modernz/progress-toggle`         | Toggle persistent progress bar                                           |
| Show OSC             | `x script-message-to modernz osc-show`             | Show OSC on command without needing to move mouse                        |
| OSC Visibility       | `y script-message-to modernz osc-visibility cycle` | OSC visibility mode. Accepts `never`, `auto`, `always` and `cycle`       |
| Cycle OSC Visibility | `Y script-binding modernz/visibility `             | Cycle OSC visibility modes                                               |
| Logo on Idle         | `z script-message-to modernz osc-idlescreen cycle` | The visibility of the mpv logo on idle. Accepts `yes`, `no`, and `cycle` |
