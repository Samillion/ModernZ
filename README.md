## ModernZ OSC
![Preview](https://github.com/user-attachments/assets/115b0dda-c1d7-484c-9032-8005b6520540)

A sleek and modern OSC for [mpv](https://mpv.io/), this project is a fork of ModernX designed to enhance functionality by adding more features, all while preserving the core standards of mpv's OSC.

If white buttons and text don't suit your taste, you have the option to fully customize the [colors](#colors) to match your preferences as much as you'd like:

![titlebar_custom](https://github.com/user-attachments/assets/7968b6f0-df16-44fd-8306-01e581b4e1a7)

![colors_custom](https://github.com/user-attachments/assets/637f0c50-16ac-4d8c-a341-187e3d71d2d3)

#### Interactive Playlist

Thanks to the guys at mpv for creating the awesome [select.lua](https://github.com/mpv-player/mpv/blob/master/player/lua/select.lua) script, which is bundled in mpv, you can now utilize it within this OSC.

Simply ***right click*** on the playlist button, then it'll show you the current playlist. You can type to select (fuzzy match), or use the up/down arrows to select the video you like.

I'm also happy to announce that mpv will include [full mouse support](https://github.com/mpv-player/mpv/pull/15016) in the interactive playlist. 🥳

> [!TIP]
> If the font size for the interactive playlist is too small, you can add the following to your `mpv.conf`
>```ini
> # change font size for console and select
> script-opts-append=console-font_size=30
>```


https://github.com/user-attachments/assets/513c7ce8-8803-4b73-82af-2d1e690fd4f0

## Get Started
- [How to Install](#how-to-install)
- [Configuration File](#configuration-file)
- [User Options](#user-options)
- [Button Interactions](#button-interactions)
- [OSC Language (Translations)](#osc-language)
- [History](#history)


**To do list**:
- [x] Re-organize the functions and variables so the order makes sense and not just random
- [x] Ensure all included functions and variables are actually used and not remnants of the past
- [x] Match mpv's `osc.lua` standards and functionality, where relative, to ensure compatibility and stability.
- [x] Improve button placements
- [x] Add an option to show a playlist button (`user_opts` mode: `get_playlist()` or `select.lua`)
- [x] Include more customization options for colors
- [ ] Add more `user_opts` validation
- [x] Add translations: German, French, Spanish, Arabic [[learn more](#osc-language)]
- [x] Hide osc when `select-playlist` is triggered
- [ ] Make first release v0.1.0
- [ ] Stop adding things to the to do list. :P

## How to install
**OSC**: Simply place `modernz.lua` in the corresponding mpv scripts folder of your operating system:

**Fonts**: Place `Material-Design-Iconic-Round.ttf` in the `fonts` folder.

**Configuration**: To adjust options, such as seek color, place `modernz.conf` in the `script-opts` folder

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

An example of a `modernz.conf` file:

```
# color of the seekbar progress and handle, in Hex color format
seekbarfg_color=#B7410E

# show playlist button? LClick: show playlist, RClick: use select.lua (if available)
showplaylist=no

# title shown on OSC (above seekbar), ${media-title} or ${filename}
title=${media-title}

# scaling of the controller when windowed
scalewindowed=1.0

# seek mode for jump buttons
jumpmode=relative
```

## User Options
This is the full list of user options you can use in `script-opts/modernz.conf`, with their possible values and description.

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
| Option           | Value     | Description                                                                                                                                         |
|------------------|-----------|-----------------------------------------------------------------------------------------------------------------------------------------------------|
| hovereffect      | yes       | whether buttons have a glowing effect when hovered over                                                                                             |
| showplaylist     | no        | show playlist button? L.Click: show playlist, R.Click: use `select.lua`                                                                             |
| showjump         | yes       | show "jump forward/backward 10 seconds" buttons                                                                                                     |
| showskip         | no        | show the skip back and forward (chapter) buttons                                                                                                    |
| showinfo         | no        | show the info button                                                                                                                                |
| showloop         | yes       | show the loop button                                                                                                                                |
| showontop        | yes       | show window on top button                                                                                                                           |
| showscreenshot   | no        | show screenshot button                                                                                                                              |
| screenshot_flag  | subtitles | flag when using the screenshot button. subtitles, video, window [[details](https://mpv.io/manual/master/#command-interface-screenshot-%3Cflags%3E)] |

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
| osc_on_seek             | no    | show osc when seeking? or input.conf: `x script-message-to modernz osc-show`         |
| automatickeyframemode   | yes   | set seekbarkeyframes based on video length to prevent laggy scrubbing on long videos |
| automatickeyframelimit  | 600   | videos of above this length (in seconds) will have seekbarkeyframes on               |

### UI [elements]
| Option                   | Value           | Description                                                          |
|--------------------------|-----------------|----------------------------------------------------------------------|
| showtitle                | yes             | show title in OSC (above seekbar)                                    |
| showwindowtitle          | yes             | show window title in borderless/fullscreen mode                      |
| showwindowcontrols       | yes             | show window controls (close, min, max) in borderless/fullscreen      |
| titleBarStrip            | no              | whether to make the title bar a singular bar instead of a black fade |
| title                    | ${media-title}  | title shown on OSC (above seekbar). ${media-title} or ${filename}    |
| font                     | mpv-osd-symbols | mpv-osd-symbols = default osc font (or the one set in mpv.conf)      |
| titlefontsize            | 30              | the font size of the title text (above seekbar)                      |
| chapter_fmt              | Chapter: %s     | chapter print format for seekbar-hover. "no" to disable              |
| persistentprogress       | no              | always show a small progress line at the bottom of the screen        |
| persistentprogressheight | 17              | the height of the persistentprogress bar                             |
| persistentbuffer         | no              | on web videos, show the buffer on the persistent progress line       |
| persistentprogresstoggle | no              | enable toggling the persistentprogress bar                           |
| compactmode              | no              | replace the jump buttons with the chapter buttons                    |

### UI [behavior]
| Option              | Value | Description                                                |
|---------------------|-------|------------------------------------------------------------|
| showonpause         | yes   | whether to show osc when paused                            |
| onpausenotimeout    | yes   | whether to disable the hide timeout on pause               |
| bottomhover         | yes   | if the osc should only display when hovering at the bottom |
| raisesubs           | yes   | whether to raise subtitles above the osc when it's shown   |
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
| tick_delay                     | 1 / 60 | minimum interval between OSC redraws in seconds        |
| tick_delay_follow_display_fps  | no     | use display fps as the minimum interval                | 


## Button Interactions
Below is a list that explains the OSC buttons function depending on how you interact with them.

> [!NOTE]
> Middle clicking performs the same function as `Shift+left mouse button`, allowing for one handed use

### Title

- `Left mouse button`: Show `media-title`
- `Right mouse button`: Show `filename`

### Seekbar

- `Left mouse button`: Seek to position (using keyframes)
- `Shift+left mouse button`: Seek to the exact position
- `Right mouse button`: Seek to the head of chosen chapter

### Playback Time

- `Left mouse button`: Display time in milliseconds

### Duration

- `Left mouse button`: Display remaining time instead of total time

### Back/Forward

- `Left mouse button`: Play previous/next file
- `Right mouse button`: Show playlist
- `Shift+left mouse button`: Show playlist

### Skip Back/Forward

- `Left mouse button`: Go to previous/next chapter
- `Right mouse button`: Show chapter list

### Jump Back/Forward

- `Left mouse button`: Jumps forwards/backwards by 10 seconds (or by the amount set in `user_opts` `jumpamount`)
- `Right mouse button`: Jumps forwards/backwards by 1 minute
- `Shift+left mouse button`: Skips to the previous/next frame (and pauses)

### Audio/Subtitle

- `Left mouse button`: Cycle to next track
- `Right mouse button`: Cycle to previous track
- `Shift+left mouse button`: Show tracks list

### Playlist

- `Left mouse button`: Show a simple playlist
- `Right mouse button click`: Show an interactive playlist ([mpv/select](https://github.com/mpv-player/mpv/blob/master/player/lua/select.lua))

### Screenshot

- `Left mouse button`: Takes a screenshot

### Pin

- `Left mouse button`: Toggle pin (and remove window border, if `user_opts` `ontopborder` is `false`)
- `Right mouse button`: Toggle pin without changing the border

### Volume

- `Left mouse button`: Cycle mute on/off
- `Scroll wheel`: Change volume up/down


## OSC Language
By default, the OSC is in English. However, it is relatively easy to add new languages.

In `modernz.lua`, the `local language` list stores the phrases and `local texts = language["en"]` sets the language with the initial defined in the list.

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
	    loopenable = "Enable looping",
	    loopdisable = "Disable looping",
	    screenshot = "Screenshot",
	    statsinfo = "Information",
	},
}

-- apply lang opts
local texts = language["en"]
```

The following is a list of languages you can add or use as reference:

<details>
  <summary>French</summary>
  
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
		statsinfo = "Information",
	},
  ```
</details>
<details>
  <summary>German</summary>
  
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
		statsinfo = "Information",
	},
  ```
</details>
<details>
  <summary>Spanish</summary>
  
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
		statsinfo = "Información",
	},
  ```
</details>
<details>
  <summary>Polish</summary>
  
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
		statsinfo = "Informacja",
	},
  ```
</details>
<details>
  <summary>Japanese</summary>
  
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
		statsinfo = "情報",
	},
  ```
</details>
<details>
  <summary>Simplified Chinese</summary>
  
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
	    statsinfo = "信息",
	},
  ```
</details>
<details>
  <summary>Arabic</summary>
  
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
