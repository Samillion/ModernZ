# ModernZ Translations Guide

This guide explains how to use, modify, and add translations for the ModernZ OSC interface.

## Table of Contents

- [Quick Start](#quick-start)
- [Available Languages](#available-languages)
- [Adding a New Language](#adding-a-new-language)
- [Modifying Existing Translations](#modifying-existing-translations)
- [Translation Keys Reference](#translation-keys-reference)
- [Contributing Translations](#contributing-translations)

## Quick Start

1. Open `modernz.lua` in your text editor
2. Locate the `language` table near the top of the file
3. Add or modify translations using the format:
   ```lua
   local language = {
       ["language-code"] = {
           welcome = "Your translation",
           off = "Your translation",
           -- ... other strings
       },
   }
   ```

## Available Languages

<details>
  <summary>French (fr)</summary>

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
  <summary>German (de)</summary>

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
  <summary>Spanish (es)</summary>

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
  <summary>Polish (pl)</summary>

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
  <summary>Japanese (jp)</summary>

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
  <summary>Simplified Chinese (zh)</summary>

> In `modernz.conf` you must use `language=chs` for it to be active.

```lua
    ["zh"] = {
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
  <summary>Arabic (ar)</summary>

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

## Adding a New Language

1. Choose a language code (e.g., "es" for Spanish)
2. Copy the English template:

```lua
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
    statsinfo = "Information"
},
```

3. Add your translation with the new language code:

```lua
["es"] = {
    welcome = "{\\fs24\\1c&H0&\\1c&HFFFFFF&}Suelta archivos o URLs aquí para reproducirlos",
    off = "APAGADO",
    na = "n/d",
    -- ... translate other strings
},
```

## Modifying Existing Translations

1. Find the language section you want to modify
2. Update the strings as needed
3. Keep any formatting codes (e.g., `{\\fs24\\1c&H0&\\1c&HFFFFFF&}`)
4. Test the changes by playing a video

## Translation Keys Reference

| Key                    | Description             | Format Notes                |
| ---------------------- | ----------------------- | --------------------------- |
| welcome                | Welcome message         | Preserve formatting codes   |
| off                    | Off state text          | Keep short                  |
| na                     | Not available           | Keep short                  |
| none                   | Nothing available       | Generic unavailable message |
| video                  | Video label             | Menu label                  |
| audio                  | Audio label             | Menu label                  |
| subtitle               | Subtitle label          | Menu label                  |
| track                  | Tracks suffix           | Follows numbers             |
| playlist               | Playlist label          | Menu label                  |
| chapter                | Chapter label           | Menu label                  |
| ontop/ontopdisable     | Window pin states       | Action labels               |
| loopenable/loopdisable | Loop states             | Action labels               |
| screenshot             | Screenshot label        | Action label                |
| screenshotsaved        | Screenshot confirmation | Status message              |
| statsinfo              | Information label       | Menu label                  |

## Contributing Translations

If you'd like to share your translations with the community:

1. Fork the [ModernZ repository](https://github.com/Samillion/ModernZ)
2. Add your translations to the TRANSLATIONS.md file under the [Available Languages](#available-languages) section:
   - Add a new collapsible section using the existing format
   - Include the language code and configuration note
   - Add your translation table in a code block
3. Submit a pull request
