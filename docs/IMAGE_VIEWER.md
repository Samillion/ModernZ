# ModernZ Image Viewer

A minimal layout is automatically applied when viewing images while using ModernZ osc, which also features zoom controls.

![modernz_image_mode](https://github.com/user-attachments/assets/e2501652-aa84-4725-93cf-5cb86931b45e)

## Zoom Controls

Below is a list that explains the zoom control functions depending on how you interact with them.

| Action            | Function                   |
| ----------------- | -------------------------- |
| Left mouse click  | Zoom in/out of image       |
| Right mouse click | Reset zoom level to normal |
| Mouse Wheel       | Zoom in/out of image       |

## Recommended
The following options will help you enhance and automate your image viewing experience with mpv. Feel free to adjust them to your liking or use case.

Reset values per viewed file, should be added in top level within `mpv.conf`:
```EditorConfig
reset-on-next-file=video-zoom,panscan,video-unscaled,video-rotate,video-align-x,video-align-y
```

[Auto profiles](https://mpv.io/manual/master/#conditional-auto-profiles) that apply useful [mpv options](https://mpv.io/manual/master/#options) and [ModernZ options](/docs/USER_OPTS.md) when viewing images:
```EditorConfig
[video]
    profile-cond=p["current-tracks/video"] and not p["current-tracks/video"].image
    profile-restore=copy-equal
    taskbar-progress=yes

[image]
    profile-desc=ModernZ osc Image Viewer mode
    profile-cond=p["current-tracks/video"] and p["current-tracks/video"].image and not p["current-tracks/video"].albumart
    profile-restore=copy-equal
    video-recenter=yes
    taskbar-progress=no
    stop-screensaver=no
    prefetch-playlist=yes
    video-aspect-override=no
    image-display-duration=inf
    title=${media-title} [${?width:${width}x${height}}]
    script-opts-append=modernz-fade_alpha=50
    script-opts-append=modernz-window_title=yes
    script-opts-append=modernz-bottomhover_zone=50
    script-opts-append=modernz-windowcontrols_title=${media-title} [${?width:${width}x${height}}]
```

## Useful
If you want to extend functionality even further to turn mpv into a full fledged image viewer, we recommend the following Github repository:
- https://github.com/guidocella/mpv-image-config

It allows you to have options such as:
- Cursor centeric zoom with scroll wheel
- Pan image, drag to pan and use gestures
- Double page mode (ie: manga)
