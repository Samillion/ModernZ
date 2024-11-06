# ModernZ Image Viewer

A minimal layout is automatically applied when viewing images while using ModernZ osc, which also features zoom controls.

![image-viewer](https://github.com/user-attachments/assets/d95942c8-0b62-47f9-bca6-8adfaab63538)

## Zoom Controls

Below is a list that explains the zoom control functions depending on how you interact with them.

| Action            | Function                   |
| ----------------- | -------------------------- |
| Left mouse click  | Zoom in/out of image       |
| Right mouse click | Reset zoom level to normal |
| Mouse Wheel       | Zoom in/out of image       |

## Recommended
It is recommended to add the following in `mpv.conf`:

Reset values on next file:
```ini
reset-on-next-file=video-rotate,video-zoom,panscan,video-unscaled,video-align-x,video-align-y
```

Auto profiles that apply useful mpv options and ModernZ [user options](/docs/USER_OPTS.md) in `Image Viewer` mode:
```ini
[Video]
    profile-cond=p["current-tracks/video"] and not p["current-tracks/video"].image
    taskbar-progress=yes

[Image]
    profile-desc=Settings for Image Viewer mode with ModernZ osc
    profile-cond=p["current-tracks/video"] and p["current-tracks/video"].image and not p["current-tracks/video"].albumart
    image-display-duration=inf
    prefetch-playlist=yes
    taskbar-progress=no
    stop-screensaver=no
    title=${media-title} [${?width:${width}x${height}}]
    script-opts-append=modernz-windowcontrols_title=${media-title} [${?width:${width}x${height}}]
    script-opts-append=modernz-window_title=yes
    script-opts-append=modernz-fade_alpha=100
    script-opts-append=modernz-bottomhover_zone=100
```

## Useful Scripts
If you want to extend functionality even further to turn mpv into a full fledged image viewer, we recommend the following Github repository:
- https://github.com/guidocella/mpv-image-config

It allows you to have options such as:
- Cursor centeric zoom with scroll wheel
- Pan image, drag to pan and use gestures
- Double page mode (ie: manga)
