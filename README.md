<h1 align="center">ModernZ - A Sleek Alternative OSC for mpv</h1>

A sleek and modern OSC for [mpv](https://mpv.io/), this project is a fork of ModernX designed to enhance functionality by adding more features, all while preserving the core standards of mpv's OSC.

![54b36db099](https://github.com/user-attachments/assets/9c11c28d-25d7-46e5-9044-67d4653b189a)

<p align="center">
    <a href="#installation"><strong>Installation »</strong></a>
  <br />
  <a href="#configuration">Configuration</a>
  ·
  <a href="#controls">Controls</a>
  ·
  <a href="#translations">OSC Language</a>
  ·
  <a href="#extras">Extra Scripts</a>
</p>

## Features

- 🎨 Modern, customizable interface with multiple layouts [[options](#configuration)]
- 🖱️ Independent hover zone for top bar (window controls) and bottom bar (OSC)
- 📷 Image Viewer mode with zoom controls [[details](/docs/IMAGE_VIEWER.md)]
- 🎛️ Buttons: download, playlist, speed control, screenshot, pin, loop, cache and more. [[details](/docs/CONTROLS.md)]
- 📄 Interactive menus for playlist, subtitles, chapters, audio tracks and audio devices
- 🌐 Multi-language support with JSON [locale](#translations) integration
- ⌨️ Configurable controls [[details](#controls)]
- 🖼️ Video thumbnail previews with [thumbfast](https://github.com/po5/thumbfast)

<a href="/docs/INTERACTIVE_MENUS.md">
    <img width="350" alt="preview_features_button_md" src="https://github.com/user-attachments/assets/f7914071-0690-45ed-b1cf-6ced74f3a8e3" />
</a>

## Customization
Choose the layout design that suits your preference, between `modern` and `modern-compact` by using the `layout` option in your `modernz.conf`.

![modern_layout](https://github.com/user-attachments/assets/452c56ce-446f-4180-b3a2-cadcdb4f97f2)

![modern_compact_layout](https://github.com/user-attachments/assets/dc53fdf3-45af-4605-a367-e172d635a4f2)

You can also change the icon theme to `fluent` or `material` to match your preferred style by using the `icon_theme` option in your `modernz.conf`

![modernz_fluent](https://github.com/user-attachments/assets/3aafac8c-a13f-4840-8119-739523eb7a8e)

![modernz_material](https://github.com/user-attachments/assets/e5ad6d06-f071-42ef-9210-296d95906d94)

Not a fan of white buttons and text? You have complete control to customize colors and button layouts to perfectly reflect your style.

![modernz_osc_controls_top](https://github.com/user-attachments/assets/9e3df3af-d3ea-41bb-8c9a-9bf64c1d895a)

![modernz_osc_controls_bottom](https://github.com/user-attachments/assets/d4e56bf5-ce7b-44e9-90a3-e27e922dd6bd)

See the [Color Customization](docs/USER_OPTS.md#colors-and-style) section in the configuration guide for details on how to customize colors and buttons.

## Installation

1. **Disable Stock OSC**

   - Add `osc=no` in your `mpv.conf`

2. **Copy Files**

   - Place `modernz.lua` in your mpv scripts directory
   - Place `fluent-system-icons.ttf` and `material-design-icons.ttf` in your mpv fonts directory
   - (OPTIONAL) Place `thumbfast.lua` in your mpv scripts directory

3. **Locations**

   ```
   Linux:   ~/.config/mpv/
   Windows: C:/Users/%username%/AppData/Roaming/mpv/
   macOS:   ~/Library/Application Support/mpv/
   ```

4. **Folder Structure** [[mpv manual](https://mpv.io/manual/master/#files)]
   ```
   📁 mpv/
   ├── 📁 fonts/
   │   ├── 📄 fluent-system-icons.ttf
   │   └── 📄 material-design-icons.ttf
   ├── 📁 script-opts/
   │   └── 📄 modernz.conf
   └── 📁 scripts/
       ├── 📄 modernz.lua
       └── 📄 thumbfast.lua (optional)
   ```

## Configuration

1. Create `modernz.conf` in the `/script-opts` folder to customize settings

   - [Download default modernz.conf](./modernz.conf)

2. Example of a short configuration:

   ```EditorConfig
   # Seekbar color (hex format)
   seekbarfg_color=#B7410E

   # Interface options
   playlist_button=no
   title=${media-title}
   scalewindowed=1.0
   window_top_bar=auto
   ```

For a full list of options, [check out the detailed list here](docs/USER_OPTS.md).

## Controls

### Button Interactions

- Left click: Primary action
- Right click: Secondary action
- Middle click/Shift+Left click: Alternative action

> [!NOTE]
> Middle clicking performs the same function as `Shift+left mouse button`, allowing for one handed use

For a full list of interactions, check out the [Button Interactions Guide](docs/CONTROLS.md).

### Keybinds

ModernZ doesn't set keybinds by default to avoid interfering with your current setup. You can add keybinds in `input.conf` if you prefer:

```
w   script-binding modernz/progress-toggle           # Toggle progress bar
x   script-message-to modernz osc-show               # Show OSC
y   script-message-to modernz osc-visibility cycle   # Set a visibility mode (cycle, auto, always, never)
Y   script-binding modernz/visibility                # Cycle visibility modes
z   script-message-to modernz osc-idlescreen         # Toggle idle screen
```

## Translations

ModernZ is currently available in English, but you can easily switch it to your preferred language! Here's how:

1. **Download the locale pack:**

Grab the [modernz-locale.json](/extras/locale/modernz-locale.json) file from this repository. This file holds translations for various languages.

2. **Add the locales to mpv:**

Copy the downloaded `modernz-locale.json` file to your mpv's `/script-opts` folder.

3. **Choose your language:**

There are two ways to set your preferred language:

- **Recommended:** Use the `modernz.conf` file

  ```ini
  # Example configuration in modernz.conf
  # Set language to Simplified Chinese
  language=zh
  ```

- **Alternative:** Edit the `modernz.lua` script

  Open `modernz.lua` and find the `user_opts` section near the beginning. Change the `language` value to your preferred code:

  ```lua
  local user_opts = {
      -- General
      language = "en",  -- Change this to your preferred language code
      ...
  }
  ```

**Need More Info?**

For a complete list of available languages, contribution guidelines, and in-depth translation documentation, head over to the [TRANSLATIONS.md](docs/TRANSLATIONS.md).

## Extras

The following scripts are ones I wrote and maintain, feel free to use them if they're useful to you.

- [Pause-Indicator-Lite](/extras/pause-indicator-lite) - A simple script that displays an indicator on pause
- [PiP-Lite](/extras/pip-lite) - Add a PiP mode (Picture-in-Picture) to ModernZ pin button and when `ontop` is enabled
- [ytdlAutoFormat](https://github.com/Samillion/mpv-ytdlautoformat) - A simple mpv script to automatically change `ytdl-format` (yt-dlp) for specified domains
- [BoxtoWide](https://github.com/Samillion/mpv-boxtowide) - A simple mpv script to change the aspect-ratio of video files/streams to a specific target ratio automatically

For even more useful scripts, check out the [mpv User Scripts Wiki](https://github.com/mpv-player/mpv/wiki/User-Scripts). It offers a wide range of community-contributed scripts to enhance your mpv experience.

## History

- [Samillion/ModernZ](https://github.com/Samillion/ModernZ)
  - forked from [dexeonify/ModernX](https://github.com/dexeonify/mpv-config/blob/main/scripts/modernx.lua)
    - forked from [cyl0/ModernX](https://github.com/cyl0/ModernX)
      - forked from [maoiscat/mpv-osc-modern](https://github.com/maoiscat/mpv-osc-modern)

**Why fork yet again?**

- Add extensive feature support, including [color customization](docs/USER_OPTS.md#colors-and-style), advanced [options](docs/USER_OPTS.md), and [locale integration](docs/TRANSLATIONS.md)
- Integrate mpv's `console` and `select` functionality to OSC
  - An approach that later inspired adoption in mpv’s stock OSC ([#1](https://github.com/mpv-player/mpv/pull/15016), [#2](https://github.com/mpv-player/mpv/pull/15031))
- Introduce a dedicated layout optimized for image viewing. See [details](/docs/IMAGE_VIEWER.md)
- Add `modern` and `modern-compact` layouts and icon themes support
- Refactor the project to align with mpv’s stock OSC standards, ensuring long-term compatibility
- Remove legacy bugs and redundant code to improve maintainability and stability
  - This also enables other `Modern` forks to build on ModernZ as a foundation, such as [zydezu/ModernX](https://github.com/zydezu/ModernX) ([reference](https://github.com/zydezu/ModernX/releases/tag/0.3.9))

In essence, to maintain and revive the `modern-osc` origin.

Having said that, ModernZ still uses parts of the old code, and every previous and current fork author and contributor deserve credit (including mpv's stock osc), that is why they're mentioned in detail.

#### Credits:

- Font: UI Fluent System Icons [[details](https://github.com/microsoft/fluentui-system-icons)] [[font file](https://github.com/Samillion/ModernZ/blob/main/fluent-system-icons.ttf)]
- Font modified by [Xurdejl](https://github.com/Xurdejl) for use on ModernZ osc
- [mpv](https://github.com/mpv-player/mpv) and their [osc.lua](https://github.com/mpv-player/mpv/blob/master/player/lua/osc.lua), as ModernZ osc was re-based on the stock osc standards and applies updates from it
- All modern osc origin and their forks as mentioned in [history](#history)
- All [contributors](https://github.com/Samillion/ModernZ/graphs/contributors), testers and users that helped directly or indirectly with ModernZ osc ❤️
