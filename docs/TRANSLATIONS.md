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

1. **Locate the translation file:** Open the `modernz-locale.json` file from the repository (typically found at [modernz-locale.json](/extras/locale/modernz-locale.json)).
2. **Edit Translations:** Use the following format to add or modify translations:

```json
{
    "language-code": {
        "idle": "Your translation",
        "na": "Your translation",
    },
}
```

Replace `"language-code"` with your language code (e.g. `"es"` for Spanish).

## Available Languages

ModernZ currently has translations for the following languages:

- French (fr)
- German (de)
- Spanish (es)
- Polish (pl)
- Japanese (jp)
- Simplified Chinese (zh)
- Arabic (ar)

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
        "no_subs": "No subtitles available",
        "no_audio": "No audio tracks available",
        "playlist": "Playlist",
        "no_list": "Playlist is empty",
        "chapter": "Chapter",
        "ontop": "Pin Window",
        "ontop_disable": "Unpin Window",
        "loop_enable": "Loop",
        "loop_disable": "Disable Loop",
        "speed_control": "Speed Control",
        "screenshot": "Screenshot",
        "stats_info": "Information",
        "zoom_in": "Zoom In",
        "zoom_out": "Zoom Out",
    },
}
```

5. **Translate the strings**: Replace the English text with your translations, keeping the same keys.

```json
{
    "es": {
        "idle": "Suelta archivos o URLs aquí para reproducirlos",
        "na": "No disponible",
        "video": "Video",
    },
}
```

## Updating existing translations

1. **Find your language**: Locate the section for your language in `modernz-locale.json`.

2. **Update the strings**

3. **Test your changes**: Play a video to verify the translations work correctly.

## Translation Keys Reference

| Key                      | Description             | Format Notes                |
| ------------------------ | ----------------------- | --------------------------- |
| idle                     | Idle state message      | Be brief                    |
| na                       | Not available           | Menu label                  |
| video                    | Video label             | Menu label                  |
| audio                    | Audio label             | Menu label                  |
| subtitle                 | Subtitle label          | Menu label                  |
| no_subs                  | No subtitles label      | Menu label                  |
| no_audio                 | No audio label          | Menu label                  |
| playlist                 | Playlist label          | Menu label                  |
| no_list                  | No playlist label       | Menu label                  |
| chapter                  | Chapter label           | Menu label                  |
| ontop/ontop_disable      | Window pin states       | Action labels               |
| loop_enable/loop_disable | Loop states             | Action labels               |
| screenshot               | Screenshot label        | Action label                |
| stats_info               | Information label       | Menu label                  |
| zoom_in                  | Zoom label              | Menu label                  |
| zoom_out                 | Zoom label              | Menu label                  |

## Contributing

If you'd like to share your translations with the community:

1. **Fork the repository**: Visit the ModernZ GitHub page (https://github.com/Samillion/ModernZ) and click "Fork" to create your own copy of the project.
2. **Edit the** `modernz-locale.json` **file** Add your translations to the file in your forked repository.
3. **Submit a Pull Request** Create a pull request on GitHub to propose your changes for review and integration.

Thank you for contributing ❤️ Every translation helps make the project better!
