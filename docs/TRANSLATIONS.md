# ModernZ Translations Guide

This guide provides everything you need to use, modify, and add translations for the ModernZ OSC interface.

## Table of Contents

- [Quick Start](#quick-start)
- [Available Languages](#available-languages)
- [Adding a New Language](#adding-a-new-language)
- [Updating Existing Translations](#updating-existing-translations)
- [Translation Keys Reference](#translation-keys-reference)
- [Contributing Translations](#contributing)

## Quick Start

To get started with translations:

1. **Locate the translation file:** Open the [`modernz-locale.json`](/extras/locale/modernz-locale.json) file from the repository.
2. **Edit Translations:** Use the following format to add or modify translations:

```json
{
    "language-code": {
        "idle": "Your translation",
        "na": "Your translation"
    }
}
```

3. Replace `"language-code"` with your language code (e.g. `"es"` for Spanish).

## Available Languages

ModernZ currently has translations for the following languages:

- Arabic (ar)
- Danish (dk)
- English (en)
- French (fr)
- German (de)
- Icelandic (is)
- Japanese (jp)
- Polish (pl)
- Russian (ru)
- Spanish (es)
- Simplified Chinese (zh)

## Adding a New Language

1. **Get the translation file**: If you haven't already, download the `modernz-locale.json` file.
2. **Open the file**: Open `modernz-locale.json` in a text editor.
3. **Choose a language code**: Pick a unique code representing your language (e.g. `"it"` for Italian).
4. **Copy an existing template**: Use an existing language section as a base. For example, use the English template:

```json
{
    "en": {
        "idle": "Drop files or URLs here to play",
        "na": "Not available",
        "video": "Video",
        "audio": "Audio",
        "subtitle": "Subtitle",
        "no_subs": "No subtitles",
        "no_audio": "No audio tracks",
        "muted": "Muted",
        "playlist": "Playlist",
        "no_playlist": "Playlist empty",
        "chapter": "Chapter",
        "ontop": "Pin window",
        "ontop_disable": "Unpin window",
        "file_loop_enable": "Loop file on",
        "file_loop_disable": "Loop file off",
        "playlist_loop_enable": "Loop playlist on",
        "playlist_loop_disable": "Loop playlist off",
        "shuffle": "Shuffle playlist on",
        "unshuffle": "Shuffle playlist off",
        "speed_control": "Playback speed",
        "screenshot": "Screenshot",
        "stats_info": "Statistics",
        "cache": "Cache",
        "buffering": "Buffering",
        "zoom_in": "Zoom in",
        "zoom_out": "Zoom out",
        "download": "Download",
        "download_in_progress": "Download in progress",
        "downloading": "Downloading",
        "downloaded": "Already downloaded",
        "menu": "Menu"
    }
}
```

5. **Translate the strings**: Replace the English text with your translations, keeping the same keys.

```json
{
    "es": {
        "idle": "Suelta archivos o URLs aquí para reproducirlos",
        "na": "No disponible",
        "video": "Video"
    }
}
```

## Updating existing translations

1. **Find your language**: Locate the section for your language in `modernz-locale.json`.

2. **Update the strings**

3. **Test your changes**: Play a video to verify the translations work correctly.

## Translation Keys Reference

| Key                                            | Description                    | Format Notes     |
| ---------------------------------------------- | ------------------------------ | ---------------- |
| `idle`                                         | Idle message                   | State label      |
| `na`                                           | Not available                  | Text label       |
| `video`                                        | Video                          | Text label       |
| `audio`                                        | Audio tracks                   | Button label     |
| `subtitle`                                     | Subtitle tracks                | Button label     |
| `no_subs`                                      | No subtitle tracks             | Button label     |
| `no_audio`                                     | No audio tracks                | Button label     |
| `muted`                                        | Audio muted                    | State label      |
| `playlist`                                     | Playlist                       | Button label     |
| `no_playlist`                                  | Playlist is empty              | Button label     |
| `chapter`                                      | Chapter                        | Text label       |
| `ontop`/`ontop_disable`                        | Window pin states              | Action labels    |
| `file_loop_enable`/`file_loop_disable`         | File loop states               | Action labels    |
| `playlist_loop_enable`/`playlist_loop_disable` | Playlist loop states           | Action labels    |
| `shuffle`/`unshuffle`                          | Playlist shuffle states        | Action labels    |
| `screenshot`                                   | Screenshot                     | Button label     |
| `stats_info`                                   | Statistics                     | Button label     |
| `cache`                                        | Cache                          | Text label       |
| `buffering`                                    | Buffering                      | State label      |
| `zoom_in`                                      | Zoom in                        | Button label     |
| `zoom_out`                                     | Zoom out                       | Button label     |
| `download`                                     | Download                       | Button label     |
| `download_in_progress`                         | Download in progress           | State label      |
| `downloading`                                  | Downloading state              | State label      |
| `downloaded`                                   | Downloaded state               | State label      |
| `menu`                                         | Menu                           | Button label     |

## Contributing

If you'd like to share your translations with the community:

1. **Fork the repository**: Visit the ModernZ GitHub page (https://github.com/Samillion/ModernZ) and click "Fork" to create your own copy of the project.
2. **Edit the** `modernz-locale.json` **file** Add your translations to the file in your forked repository.
3. **Submit a Pull Request** Create a pull request on GitHub to propose your changes for review and integration.

Thank you for contributing ❤️ Every translation helps make the project better!
