## ModernZ OSC
![Preview](https://github.com/user-attachments/assets/115b0dda-c1d7-484c-9032-8005b6520540)

A sleek and modern OSC for [mpv](https://mpv.io/), this project is a fork of ModernX designed to enhance functionality by adding more features, all while preserving the core standards of mpv's OSC.

If white buttons and text don't suit your taste, you have the option to fully customize the [colors](#colors) and display specific [buttons](#buttons) to match your preferences as much as you'd like:

![titlebar_custom](https://github.com/user-attachments/assets/7968b6f0-df16-44fd-8306-01e581b4e1a7)

![colors_custom](https://github.com/user-attachments/assets/637f0c50-16ac-4d8c-a341-187e3d71d2d3)

#### Interactive Lists

Thanks to the mpv team for developing the excellent [select](https://github.com/mpv-player/mpv/blob/master/player/lua/select.lua) script and including it starting mpv [v0.39.0](https://github.com/mpv-player/mpv/discussions/14903), you can now seamlessly access it through this OSC.

https://github.com/user-attachments/assets/60af24fc-f18f-40ed-8eaa-1f3198ded786

| Button(s)      | Action            | Function                           |
|----------------|-------------------|------------------------------------|
| Playlist       | Left mouse click  | Show an interactive playlist       |
| Audio/Subtitle | Right mouse click | Show an interactive tracks list    |
| Skip           | Right mouse click | Show an interactive chapters list  |

You can find more details on button interactions [here](#button-interactions).

> [!TIP]
> If the font size for the interactive playlist is too small, you can add the following in your `mpv.conf`
> ```ini
> # change font size for console and select
> script-opts-append=console-font_size=25
> ```

## Get Started
- [How to Install](#how-to-install)
- [Configuration File](#configuration-file)
- [User Options](#user-options)
- [Button Interactions](#button-interactions)
- [Keybinds](#keybinds)
- [OSC Language (Translations)](#osc-language)
- [History](#history)

## How to install
**OSC**: Simply place `modernz.lua` in the corresponding mpv scripts folder of your operating system:

**Fonts**: Place `Material-Design-Iconic-Round.ttf` in the `fonts` folder.

**Thumbfast**: This OSC supports [thumbfast](https://github.com/po5/thumbfast). No additional steps needed, just place it in the `scripts` folder.

```
conf/mpv
│
├───fonts
│       Material-Design-Iconic-Round.ttf
│
├───script-opts
│       modernz.conf
│
└───scripts
        modernz.lua
        thumbfast.lua (optional)
```

> [!TIP]
> More information about files locations can be found [here](https://mpv.io/manual/master/#files)

## Configuration File
To customize options or colors, you can add `modernz.conf` in the `script-opts` folder, then add the options in there as you like.

You can download a configuration file containing all the options in their default values [here](https://github.com/Samillion/ModernZ/blob/main/modernz.conf), then adjust their values to your taste.

Another way would be to create a shorter version with only the options you want changed.

An example of a short `modernz.conf` file:

```
# color of the seekbar progress and handle, in Hex color format
seekbarfg_color=#B7410E

# show playlist button?
showplaylist=no

# title above seekbar
title=${media-title}

# scaling of the controller when windowed
scalewindowed=1.0

# seek mode for jump buttons
jumpmode=relative
```

## User Options
Below is the full list of options you can use in `modernz.conf`, with their default values and description.

### General
| Option          | Value | Description                                          |
|-----------------|-------|------------------------------------------------------|
| idlescreen      | yes   | show mpv logo on idle                                |
| windowcontrols  | auto  | whether to show OSC window controls. auto, yes or no |
| showwindowed    | yes   | show OSC when windowed?                              |
| showfullscreen  | yes   | show OSC when fullscreen?                            |
| greenandgrumpy  | no    | disable santa hat in December                        |

### Colors
| Option                | Value    | Description                                                              |
|-----------------------|----------|--------------------------------------------------------------------------|
| osc_color             | #000000  | accent of the OSC and the title bar                                      |
| window_title_color    | #FFFFFF  | color of title in borderless/fullscreen mode                             |
| window_controls_color | #FFFFFF  | color of window controls (close, min, max) in borderless/fullscreen mode |
| seekbarfg_color       | #BE4D25  | color of the seekbar progress and handle                                 |
| seekbarbg_color       | #FFFFFF  | color of the remaining seekbar                                           |
| title_color           | #FFFFFF  | color of the title (above seekbar)                                       |
| time_color            | #FFFFFF  | color of timestamps (below seekbar)                                      |
| side_buttons_color    | #FFFFFF  | color of side buttons (audio, sub, playlist, vol, loop, info..etc)       |
| middle_buttons_color  | #FFFFFF  | color of middle buttons (skip, jump, chapter...etc)                      |
| playpause_color       | #FFFFFF  | color of play/pause button                                               |

### Buttons
| Option           | Value     | Description                                                                                                                                                   |
|------------------|-----------|---------------------------------------------------------------------------------------------------------------------------------------------------------------|
| hovereffect      | yes       | whether buttons have a glowing effect when hovered over                                                                                                       |
| showplaylist     | no        | show playlist button                                                                                                                                          |
| showjump         | yes       | show "jump forward/backward 10 seconds" buttons                                                                                                               |
| showskip         | no        | show the skip back and forward (chapter) buttons                                                                                                              |
| shownextprev     | yes       | show the next/previous playlist track buttons                                                                                                                 |
| showinfo         | no        | show the info button                                                                                                                                          |
| showloop         | yes       | show the loop button                                                                                                                                          |
| showfullscreen   | yes       | show the fullscreen toggle button                                                                                                                             |
| showontop        | yes       | show window on top button                                                                                                                                     |
| showscreenshot   | no        | show screenshot button                                                                                                                                        |
| screenshot_flag  | subtitles | flag for the screenshot button. `subtitles` `video` `window` `each-frame` [[details](https://mpv.io/manual/master/#command-interface-screenshot-%3Cflags%3E)] |

### Scaling
| Option            | Value | Description                                    |
|-------------------|-------|------------------------------------------------|
| vidscale          | yes   | whether to scale the controller with the video |
| scalewindowed     | 1.0   | scaling of the controller when windowed        |
| scalefullscreen   | 1.0   | scaling of the controller when fullscreen      |
| scaleforcedwindow | 1.0   | scaling when rendered on a forced window       |

### Time & Volume
| Option            | Value    | Description                                                       |
|-------------------|----------|-------------------------------------------------------------------|
| unicodeminus      | no       | whether to use the Unicode minus sign character in remaining time |
| timetotal         | yes      | display total time instead of remaining time?                     |
| timems            | no       | display timecodes with milliseconds?                              |
| timefontsize      | 18       | the font size of the time                                         |
| jumpamount        | 10       | change the jump amount (in seconds by default)                    |
| jumpiconnumber    | yes      | show different icon when jumpamount is 5, 10, or 30               |
| jumpmode          | relative | seek mode for jump buttons                                        |
| volumecontrol     | yes      | whether to show mute button and volume slider                     |
| volumecontroltype | linear   | use "linear" or "log" (logarithmic) volume scale                  |

### Seeking
| Option                  | Value | Description                                                                          |
|-------------------------|-------|--------------------------------------------------------------------------------------|
| seekbarkeyframes        | no    | use keyframes when dragging the seekbar                                              |
| seekbarhandlesize       | 0.8   | size ratio of the slider handle, range 0 ~ 1                                         |
| seekrange               | yes   | show seekrange overlay                                                               |
| seekrangealpha          | 150   | transparency of seekranges                                                           |
| livemarkers             | yes   | update seekbar chapter markers on duration change                                    |
| osc_on_seek             | no    | show osc when seeking?                                                               |
| automatickeyframemode   | yes   | set seekbarkeyframes based on video length to prevent laggy scrubbing on long videos |
| automatickeyframelimit  | 600   | videos of above this length (in seconds) will have seekbarkeyframes on               |

### UI [elements]
| Option                   | Value                 | Description                                                          |
|--------------------------|-----------------------|----------------------------------------------------------------------|
| showtitle                | yes                   | show title in OSC (above seekbar)                                    |
| showwindowtitle          | yes                   | show window title in borderless/fullscreen mode                      |
| showwindowcontrols       | yes                   | show window controls (close, min, max) in borderless/fullscreen      |
| titleBarStrip            | no                    | whether to make the title bar a singular bar instead of a black fade |
| title                    | ${media-title}        | title above seekbar. ${media-title} or ${filename} (can use /no-ext) |
| font                     | mpv-osd-symbols       | mpv-osd-symbols = default osc font (or the one set in mpv.conf)      |
| titlefontsize            | 30                    | the font size of the title text (above seekbar)                      |
| chapter_fmt              | Chapter: %s           | chapter print format for seekbar-hover. "no" to disable              |
| persistentprogress       | no                    | always show a small progress line at the bottom of the screen        |
| persistentprogressheight | 17                    | the height of the persistentprogress bar                             |
| persistentbuffer         | no                    | on web videos, show the buffer on the persistent progress line       |

### UI [behavior]
| Option              | Value | Description                                                |
|---------------------|-------|------------------------------------------------------------|
| showonpause         | yes   | whether to show osc when paused                            |
| keeponpause         | yes   | whether to disable the hide timeout on pause               |
| bottomhover         | yes   | if the osc should only display when hovering at the bottom |
| raisesubs           | yes   | whether to raise subtitles above the osc when it's shown   |
| raisesubamount      | 175   | how much subtitles rise when the osc is shown              |
| thumbnailborder     | 2     | the width of the thumbnail border (thumbfast)              |
| OSCfadealpha        | 150   | alpha of the background box for the OSC                    |
| boxalpha            | 75    | alpha of the window title bar                              |
| ontopborder         | no    | If you pin the window, keep window border?                 |
| loopinpause         | yes   | activate looping by right clicking pause                   |
| visibility          | auto  | only used at init to set visibility_mode(...)              |

### UI [time-based]
| Option                         | Value  | Description                                            |
|--------------------------------|--------|--------------------------------------------------------|
| hidetimeout                    | 2000   | duration in ms until OSC hides if no mouse movement    |
| fadeduration                   | 250    | duration of fade out in ms, 0 = no fade                |
| minmousemove                   | 0      | amount of pixels the mouse has to move for OSC to show |
| tick_delay                     | 0.0167 | minimum interval between OSC redraws in seconds        |
| tick_delay_follow_display_fps  | no     | use display fps as the minimum interval                | 


## Button Interactions
Below is a list that explains the OSC buttons function depending on how you interact with them.

> [!NOTE]
> Middle clicking performs the same function as `Shift+left mouse button`, allowing for one handed use

### Title

| Action                | Function                  |
|-----------------------|---------------------------|
| Left mouse click      | Show `media-title` in OSD |
| Right mouse click     | Show `filename` in OSD    |

### Seekbar

| Action                    | Function                               |
|---------------------------|----------------------------------------|
| Left mouse click          | Seek to position (using keyframes)     |
| Shift+left mouse click    | Seek to the exact position             |
| Right mouse click         | Seek to the head of chosen chapter     |
| Scroll wheel              | Seek forward/backwards                 |

### Playback Time

| Action                | Function                        |
|-----------------------|---------------------------------|
| Left mouse click      | Display time in milliseconds    |

### Duration

| Action                | Function                                       |
|-----------------------|------------------------------------------------|
| Left mouse click      | Display remaining time instead of total time   |

### Play/Pause

| Action                | Function                   |
|-----------------------|----------------------------|
| Left mouse click      | Toggle play/pause          |
| Right mouse click     | Toggle enable/disable loop |

### Back/Forward

| Action                    | Function                  |
|---------------------------|---------------------------|
| Left mouse click          | Play previous/next file   |
| Right mouse click         | Show a simple playlist    |
| Shift+left mouse click    | Show a simple playlist    |

### Skip Back/Forward

| Action                  | Function                              |
|-------------------------|---------------------------------------|
| Left mouse click        | Go to previous/next chapter           |
| Right mouse click       | Show an interactive chapters list     |
| Shift+left mouse click  | Jump forwards/backwards by 60 seconds |
| Shift+right mouse click | Show a simple chapters list           |

### Jump Back/Forward

| Action                    | Function                                                                |
|---------------------------|-------------------------------------------------------------------------|
| Left mouse click          | Jumps forwards/backwards by 10 seconds (or by `user_opts` `jumpamount`) |
| Right mouse click         | Jumps forwards/backwards by 1 minute                                    |
| Shift+left mouse click    | Skips to the previous/next frame (and pauses)                           |

### Audio/Subtitle

| Action                    | Function                            |
|---------------------------|-------------------------------------|
| Left mouse click          | Cycle audio/subtitle track          |
| Right mouse click         | Show an interactive tracks list     |
| Shift+left mouse click    | Show a simple tracks list           |
| Scroll wheel              | Cycle audio/subtitle tracks up/down |

### Playlist

| Action                | Function                     |
|-----------------------|------------------------------|
| Left mouse click      | Show an interactive playlist |
| Right mouse click     | Show a simple playlist       |

### Screenshot

| Action                | Function               |
|-----------------------|------------------------|
| Left mouse click      | Take a screenshot      |

### Pin

| Action                | Function                                |
|-----------------------|-----------------------------------------|
| Left mouse click      | Toggle pin and toggle window border     |
| Right mouse click     | Toggle pin without changing the border  |

### Volume

| Action                | Function               |
|-----------------------|------------------------|
| Left mouse click      | Toggle mute on/off     |
| Scroll wheel          | Change volume up/down  |

## Keybinds
The OSC does not set its own keybinds to not disturb the user. Most of the functions are done by interacting with elements in the OSC itself.

You have an option to set keybinds in `input.conf` with the following:

| Function                | Input Command                                      | Description                                                               |
|-------------------------|----------------------------------------------------|---------------------------------------------------------------------------|
| Persistent Progress     | `w script-binding modernz/progress-toggle`         | Toggle persistent progress bar                                            |
| Show OSC                | `x script-message-to modernz osc-show`             | Show OSC on command without needing to move mouse                         |
| OSC Visibility          | `y script-message-to modernz osc-visibility cycle` | OSC visibility mode. Accepts `never`, `auto`, `always` and `cycle`        |
| Logo on Idle            | `z script-message-to modernz osc-idlescreen cycle` | The visibility of the mpv logo on idle. Accepts `yes`, `no`, and `cycle`  |

## OSC Language
By default, the OSC only has English language. However, it is relatively easy to add other languages.

In `modernz.lua`, the `local language` stores phrases for the English language labeled as `["en"]`:

```lua
-- Localization
local language = {
    ["en"] = {
	    welcome = "{\\fs24\\1c&H0&\\1c&HFFFFFF&}Drop files or URLs to play here",
	    off = "OFF",
	    na = "n/a",
	    none = "None available",
	    video = "Video",
	    audio = "Audio",
	    subtitle = "Subtitle",
	    nosub = "No subtitles available",
	    noaudio = "No audio tracks available",
	    track = " tracks:",
	    playlist = "Playlist",
	    nolist = "Empty playlist.",
	    chapter = "Chapter",
	    nochapter = "No chapters.",
	    ontop = "Pin window",
	    ontopdisable = "Unpin window",
	    loopenable = "Enable loop",
	    loopdisable = "Disable loop",
	    screenshot = "Screenshot",
	    screenshotsaved = "Screenshot saved",
	    statsinfo = "Information",
    },
}
```

You can use the following language lists to adjust or add more languages to `local language` in `modernz.lua`:

<details>
  <summary>French</summary>

  > In `modernz.conf` you must use `language=fr` for it to be active.

```lua
    ["fr"] = {
	    welcome = "{\\fs24\\1c&H0&\\1c&HFFFFFF&}Déposez des fichiers ou des URLs ici pour les lire",
	    off = "DÉSACTIVÉ",
	    na = "n/d",
	    none = "Aucun disponible",
	    video = "Vidéo",
	    audio = "Audio",
	    subtitle = "Sous-titre",
	    nosub = "Pas de sous-titres disponibles",
	    noaudio = "Pas de pistes audio disponibles",
	    track = " pistes:",
	    playlist = "Liste de lecture",
	    nolist = "Liste de lecture vide.",
	    chapter = "Chapitre",
	    nochapter = "Pas de chapitres.",
	    ontop = "Épingler la fenêtre",
	    ontopdisable = "Désépingler la fenêtre",
	    loopenable = "Activer la boucle",
	    loopdisable = "Désactiver la boucle",
	    screenshot = "Capture d'écran",
	    screenshotsaved = "Capture d'écran enregistrée",
	    statsinfo = "Information",
    },
```
</details>
<details>
  <summary>German</summary>

  > In `modernz.conf` you must use `language=de` for it to be active.

```lua
    ["de"] = {
	    welcome = "{\\fs24\\1c&H0&\\1c&HFFFFFF&}Dateien oder URLs hier ablegen, um sie abzuspielen",
	    off = "AUS",
	    na = "k.A.",
	    none = "Keine verfügbar",
	    video = "Video",
	    audio = "Audio",
	    subtitle = "Untertitel",
	    nosub = "Keine Untertitel verfügbar",
	    noaudio = "Keine Audiospuren verfügbar",
	    track = " Spuren:",
	    playlist = "Wiedergabeliste",
	    nolist = "Leere Wiedergabeliste.",
	    chapter = "Kapitel",
	    nochapter = "Keine Kapitel.",
	    ontop = "Fenster fixieren",
	    ontopdisable = "Fensterfixierung aufheben",
	    loopenable = "Schleifen aktivieren",
	    loopdisable = "Schleifen deaktivieren",
	    screenshot = "Screenshot",
	    screenshotsaved = "Screenshot gespeichert",
	    statsinfo = "Information",
    },
```
</details>
<details>
  <summary>Spanish</summary>

  > In `modernz.conf` you must use `language=es` for it to be active.

```lua
    ["es"] = {
	    welcome = "{\\fs24\\1c&H0&\\1c&HFFFFFF&}Suelta archivos o URLs aquí para reproducirlos",
	    off = "APAGADO",
	    na = "n/d",
	    none = "Ninguno disponible",
	    video = "Video",
	    audio = "Audio",
	    subtitle = "Subtítulo",
	    nosub = "No hay subtítulos disponibles",
	    noaudio = "No hay pistas de audio disponibles",
	    track = " pistas:",
	    playlist = "Lista de reproducción",
	    nolist = "Lista de reproducción vacía.",
	    chapter = "Capítulo",
	    nochapter = "No hay capítulos.",
	    ontop = "Fijar ventana",
	    ontopdisable = "Desfijar ventana",
	    loopenable = "Activar bucle",
	    loopdisable = "Desactivar bucle",
	    screenshot = "Captura de pantalla",
	    screenshotsaved = "Captura de pantalla guardada",
	    statsinfo = "Información",
    },
```
</details>
<details>
  <summary>Polish</summary>

  > In `modernz.conf` you must use `language=pl` for it to be active.

```lua
    ["pl"] = {
	    welcome = "{\\fs24\\1c&H0&\\1c&HFFFFFF&}Upuść plik lub łącze URL do odtworzenia",
	    off = "WYŁ.",
	    na = "n/a",
	    none = "nic",
	    video = "Wideo",
	    audio = "Audio",
	    subtitle = "Napisy",
	    nosub = "Brak dostępnych napisów",
	    noaudio = "Brak dostępnych ścieżek dźwiękowych",
	    track = " ścieżki:",
	    playlist = "Lista odtwarzania",
	    nolist = "Lista odtwarzania pusta.",
	    chapter = "Rozdział",
	    nochapter = "Brak rozdziałów.",
	    ontop = "Przypnij okno do góry",
	    ontopdisable = "Odepnij okno od góry",
	    loopenable = "Włączenie zapętlenia",
	    loopdisable = "Wyłączenie zapętlenia",
	    screenshot = "Zrzut ekranu",
	    screenshotsaved = "Zrzut ekranu zapisany",
	    statsinfo = "Informacja",
    },
```
</details>
<details>
  <summary>Japanese</summary>

  > In `modernz.conf` you must use `language=jp` for it to be active.

```lua
    ["jp"] = {
	    welcome = "{\\fs24\\1c&H0&\\1c&HFFFFFF&}ファイルやURLのリンクをここにドロップすると再生されます",
	    off = "OFF",
	    na = "n/a",
	    none = "なし",
	    video = "ビデオ",
	    audio = "オーディオ",
	    subtitle = "サブタイトル",
	    nosub = "字幕はありません",
	    noaudio = "オーディオトラックはありません",
	    track = "トラック:",
	    playlist = "プレイリスト",
	    nolist = "空のプレイリスト.",
	    chapter = "チャプター",
	    nochapter = "利用可能なチャプターはありません.",
	    ontop = "ピンウィンドウをトップに表示",
	    ontopdisable = "ウィンドウを上からアンピンする",
	    loopenable = "ループON",
	    loopdisable = "ループOFF",
	    screenshot = "スクリーンショット",
	    screenshotsaved = "スクリーンショットが保存されました",
	    statsinfo = "情報",
    },
```
</details>
<details>
  <summary>Simplified Chinese</summary>

  > In `modernz.conf` you must use `language=chs` for it to be active.

```lua
    ["chs"] = {
	    welcome = "{\\fs24\\1c&H0&\\1c&HFFFFFF&}将文件或URL放在这里播放",
	    off = "关闭",
	    na = "n/a",
	    none = "无数据",
	    video = "视频",
	    audio = "音频",
	    subtitle = "字幕",
	    nosub = "没有字幕",
	    noaudio = "不提供音轨",
	    track = "：",
	    playlist = "播放列表",
	    nolist = "无列表信息",
	    chapter = "章节",
	    nochapter = "无章节信息",
	    ontop = "启用窗口停留在顶层",
	    ontopdisable = "禁用停留在顶层的窗口",
	    loopenable = "启用循环功能",
	    loopdisable = "禁用循环功能",
	    screenshot = "截屏",
	    screenshotsaved = "截图已保存",
	    statsinfo = "信息",
    },
```
</details>
<details>
  <summary>Arabic</summary>

  > In `modernz.conf` you must use `language=ar` for it to be active.

```lua
    ["ar"] = {
	    welcome = "{\\fs24\\1c&H0&\\1c&HFFFFFF&}أسقط الملفات أو الروابط هنا للتشغيل",
	    off = "إيقاف",
	    na = "غير متاح",
	    none = "غير متوفر",
	    video = "فيديو",
	    audio = "صوت",
	    subtitle = "الترجمة",
	    nosub = "لا توجد ترجمات",
	    noaudio = "لا توجد مسارات صوتية",
	    track = " مسارات:",
	    playlist = "قائمة التشغيل",
	    nolist = "قائمة التشغيل فارغة.",
	    chapter = "الفصل",
	    nochapter = "لا توجد فصول.",
	    ontop = "تثبيت النافذة",
	    ontopdisable = "إلغاء تثبيت النافذة",
	    loopenable = "تمكين التكرار",
	    loopdisable = "تعطيل التكرار",
	    screenshot = "لقطة شاشة",
	    screenshotsaved = "تم حفظ لقطة الشاشة",
	    statsinfo = "معلومات",
    },
```
</details>

### Why aren't they included in user options already?

They were, once. It would be difficult for me to maintain it accurately for many languages. This way, users have the option to localize it without flooding the OSC file with language listings.

## History
- [Samillion/ModernZ](https://github.com/Samillion/ModernZ)
	- forked from [zydezu/ModernX](https://github.com/zydezu/ModernX)
		- forked from [dexeonify/ModernX](https://github.com/dexeonify/mpv-config/blob/main/scripts/modernx.lua)
			- forked from [cyl0/ModernX](https://github.com/cyl0/ModernX)
				- forked from [maoiscat/mpv-osc-modern](https://github.com/maoiscat/mpv-osc-modern)

Looking at the fork history, I asked myself:
> Doesn't that mean you stripped it back down to be a near match of the original?

Absolutely, yes. :stuck_out_tongue_closed_eyes:

The caveat here is that I only asked myself that after the fact, and since then, many improvements and features were added.

Arguing with myself, I concluded: The main idea was to re-do the project to keep mpv's OSC standards for functionality and compatibility. It's a nice side project that is teaching me a lot about mpv and lua.

Still, all the people there deserve credit for their great work.
