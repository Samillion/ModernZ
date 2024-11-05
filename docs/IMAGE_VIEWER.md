# ModernZ Image Viewer

A minimal layout is automatically applied when viewing images while using ModernZ osc, which also features zoom controls.

![image](https://github.com/user-attachments/assets/e602b931-fc78-4171-b49b-6731521c6225)

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

Auto profile for images only that applies useful mpv options and ModernZ [user options](/docs/USER_OPTS.md):
```ini
[Image-Viewer]
    profile-desc=Settings for Image Viewer mode with ModernZ osc
    profile-cond=p["current-tracks/video"] and p["current-tracks/video"].image and not p["current-tracks/video"].albumart
    prefetch-playlist=yes
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
