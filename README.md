## ModernZ
A fork of [zydezu/ModernX OSC](https://github.com/zydezu/ModernX) for mpv. ModernZ could be considered a lite version, since it strips many web features, but also the purpose is to re-do the project and follow mpv's OSC standards, while keeping a modern look.

![Preview](https://github.com/user-attachments/assets/92e6d48f-8b79-4634-b541-f8b69248f446)

## What's different in ModernZ?
The one I forked from has many great additional features, mostly relating to online videos, which for my use case is not really needed. So I decided to create this version.

**Changes**: (commits: [initial](https://github.com/Samillion/ModernX-Lite/commit/1fd04350069c20f0b1faa568e97c51b3e2907795) - [major](https://github.com/Samillion/ModernX-Lite/commit/9dbc3fe04914317df9a7e979ed756bb344ef3ed5))
- Removed youtube dislikes
- Removed youtube description
- Removed youtube comments
- Removed dynamic osc title (based on web video metadata)
- Removed download video related options
- Removed altering window title
- Removed all unused functions, variables and parameters
- Applied relative patches from [mpv/osc.lua](https://github.com/mpv-player/mpv/blob/master/player/lua/osc.lua), going far back as mid 2022

These changes might introduce bugs. It shouldn't, but it's always possible. If found, please open an issue.

For a full list click [here](https://github.com/Samillion/ModernX-Lite/commits/main/modernxlite.lua) and [here](https://github.com/Samillion/ModernZ/commits/main/modernz.lua)

**To do list**:
- [x] Re-organize the functions and variables so the order makes sense and not just random
- [x] Ensure all included functions and variables are actually used and not remnants of the past
- [x] Match mpv's `osc.lua` standards and functionality, where relative, to ensure compatibility and stability.
- [x] Improve button placements
- [x] Add an option to show a playlist button (`user_opts` mode: `get_playlist()` or `select.lua`)
- [ ] Include more customization options for colors
- [ ] Add more `user_opts` validation
- [x] Add translations: German, French, Spanish, Arabic [[learn more](#osc-language)]
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

```properties
# For a full list of options, see user_opts in modernz.lua

# if the osc should only display when hovering at the bottom
bottomhover=yes

# whether to raise subtitles above the osc when it's shown
raisesubs=yes

# always show a small progress line at the bottom of the screen
persistentprogress=no

# show title in OSC (above seekbar)
showtitle=yes

# title shown on OSC (above seekbar), ${media-title} or ${filename}
title=${media-title}

# color of the seekbar progress and handle, in Hex color format
seekbarfg_color=#B7410E

# icon style, 'solid' or 'round'
iconstyle=round

# whether buttons have a glowing effect when hovered over
hovereffect=yes

# show playlist button? LClick: show playlist, RClick: use select.lua (if available)
showplaylist=no

# show different icon when jumpamount is 5, 10, or 30
jumpiconnumber=yes

# show "jump forward/backward 10 seconds" buttons 
showjump=yes

# show the skip back and forward (chapter) buttons
showskip=no

# show the info button
showinfo=yes

# show the loop button
showloop=yes

# show window on top button
showontop=yes

# if you pin the window, keep window border?
ontopborder=no

# show screenshot button
showscreenshot=no
```

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

The caviat here is that I only asked myself that after the fact.

Arguing with myself, I concluded: The main idea is to re-do the project to keep mpv's OSC standards for functionality and compatibility. It's a nice side project that is teaching me a lot about mpv and lua.

Still, all the people there deserve credit for their great work.
