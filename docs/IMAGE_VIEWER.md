# ModernZ Image Viewer

A minimal layout is automatically used when viewing images while using ModernZ osc, which also features image zoom controls.

![image](https://github.com/user-attachments/assets/e602b931-fc78-4171-b49b-6731521c6225)

## Button Interactions

Below is a list that explains the OSC buttons function depending on how you interact with them.

### Zoom Controls

| Action            | Function                   |
| ----------------- | -------------------------- |
| Left mouse click  | Zoom in/out of image       |
| Right mouse click | Reset zoom level to normal |

## Recommended
It is highly recommended to add the following in `mpv.conf`:

Reset values to normal on next file:
```ini
reset-on-next-file=video-rotate,video-zoom,panscan,video-unscaled,video-align-x,video-align-y
```

Auto profile for images that applies useful options from mpv and ModernZ [user options](/docs/USER_OPTS.md):
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
