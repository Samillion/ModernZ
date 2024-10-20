# ModernZ Translations Guide

This guide provides everything you need to use, modify, and add translations for the ModernZ OSC interface.

## Table of Contents

- [Quick Start](#quick-start)
- [Available Languages](#available-languages)
- [Adding a New Language](#adding-a-new-language)
- [Updating Existing Translations](#updating-existing-translations)
- [Translation Keys Reference](#translation-keys-reference)
- [Contributing Translations](#contributing-translations)

## Quick Start

To get started with translations:

1. **Locate the translation file:** Open the `modernz-locale.lua` file from the repository (typically found at [`../modernz-locale.lua`](../modernz-locale.lua)).
2. **Edit Translations:** Use the following format to add or modify translations:
   ```lua
   ["language-code"] = {
   	welcome = "Your translation",
   	off = "Your translation",
   	-- ... other strings
   }
   ```

- Replace `"language-code"` with your language code (e.g., "es" for Spanish).

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

1. **Get the translation file**: If you haven't already, download the `modernz-locale.lua` file.
2. **Open the file**: Open `modernz-locale.lua` in a text editor.
3. **Choose a language code**: Pick a unique code representing your language (e.g., "it" for Italian).
4. **Copy an existing template**: Use an existing language section as a base. For example, use the English template:

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

5. **Translate the strings**: Replace the English text with your translations, keeping the same keys.

   ```lua
   ["es"] = {
       welcome = "{\\fs24\\1c&H0&\\1c&HFFFFFF&}Suelta archivos o URLs aquí para reproducirlos",
       off = "APAGADO",
       na = "n/d",
       -- ... translate other strings
   },
   ```

## Updating existing translations

1. **Find your language**: Locate the section for your language in `modernz-locale.lua`.

2. **Update the strings**: ensuring you preserve any formatting codes.

   (e.g., `{\\fs24\\1c&H0&\\1c&HFFFFFF&}`).

3. **Test your changes**: Play a video to verify the translations work correctly.

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

## Contributing

If you'd like to share your translations with the community:

1. **Fork the repository**: Visit the ModernZ GitHub page (https://github.com/cyl0/ModernX) and click "Fork" to create your own copy of the project.

2. **Edit the** `modernz-locale.lua` **file** Add your translations to the file in your forked repository.

3. **Submit a Pull Request** Create a pull request on GitHub to propose your changes for review and integration.

---

Thanks for contributing ❤️ Every translation helps make the project better!
