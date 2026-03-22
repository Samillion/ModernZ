<h1 align="center">ModernZ - A Sleek Alternative OSC for mpv</h1>

A sleek and modern OSC for [mpv](https://mpv.io/), this project is a fork of ModernX designed to enhance functionality by adding more features, all while preserving the core standards of mpv's OSC.

<img width="1715" height="966" alt="ModernZ" src="https://github.com/user-attachments/assets/60108e23-01b4-4928-a2cf-9b5de73364dc" />

<p align="center">
    <a href="#installation"><strong>Installation »</strong></a>
  <br>
  <a href="#configuration">Configuration</a>
  ·
  <a href="#controls">Controls</a>
  ·
  <a href="#translations">OSC Language</a>
  ·
  <a href="#extras">Extra Scripts</a>
</p>

## Features

- 🎨 Modern, customizable interface with multiple layouts, themes and icon styles [[options](#configuration)]
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

### Layouts

<table>
    <thead>
        <tr>
            <th><code>modern</code></th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><img width="1717" height="120" alt="fluent_mixed_modernz" src="https://github.com/user-attachments/assets/b1e1a865-d8b2-4ca6-aeff-fe36e30ed138" /></td>
        </tr>
    </tbody>
</table>

<table>
    <thead>
        <tr>
            <th><code>modern-compact</code></th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><img width="1717" height="150" alt="modern-compact_mixed_fluent" src="https://github.com/user-attachments/assets/98c082a7-877c-4d52-bbcb-3dd2621ac055" /></td>
        </tr>
    </tbody>
</table>

### Themes

You can also change the icon theme to `fluent` or `material` to match your preferred style by using the `icon_theme` option in your `modernz.conf`

<table>
    <thead>
        <tr>
            <th><code>fluent</code></th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><img width="1717" height="120" alt="fluent_mixed_modernz" src="https://github.com/user-attachments/assets/b1e1a865-d8b2-4ca6-aeff-fe36e30ed138" /></td>
        </tr>
    </tbody>
</table>

<table>
    <thead>
        <tr>
            <th><code>material</code></th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><img width="1717" height="120" alt="material_mixed_modernz" src="https://github.com/user-attachments/assets/ed4056c6-a672-47a0-b356-cde3d7186079" /></td>
        </tr>
    </tbody>
</table>

### Theme Styles

Both `fluent` and `material` themes have different styles as well. By using the `icon_style` option, you can choose `mixed`, `filled` or `outline`.

<table>
    <thead>
        <tr>
            <th colspan="2"><code>fluent</code></th>
        </tr>
        <tr>
            <th>Style</th>
            <th>Preview</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><code>mixed</code></td>
            <td><img width="1717" height="120" alt="fluent_mixed_modernz" src="https://github.com/user-attachments/assets/b1e1a865-d8b2-4ca6-aeff-fe36e30ed138" /></td>
        </tr>
        <tr>
            <td><code>filled</code></td>
            <td><img width="1717" height="120" alt="fluent_filled_modernz" src="https://github.com/user-attachments/assets/d91ee69d-29b2-43b6-9959-f84d8d8a06eb" /></td>
        </tr>
        <tr>
            <td><code>outline</code></td>
            <td><img width="1717" height="120" alt="fluent_outline_modernz" src="https://github.com/user-attachments/assets/f3a0572a-a8eb-47d9-83a3-807165fb88d0" /></td>
        </tr>
    </tbody>
</table>

<table>
    <thead>
        <tr>
            <th colspan="2"><code>material</code></th>
        </tr>
        <tr>
            <th>Style</th>
            <th>Preview</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><code>mixed</code></td>
            <td><img width="1717" height="120" alt="material_mixed_modernz" src="https://github.com/user-attachments/assets/ed4056c6-a672-47a0-b356-cde3d7186079" /></td>
        </tr>
        <tr>
            <td><code>filled</code></td>
            <td><img width="1717" height="120" alt="material_filled_modernz" src="https://github.com/user-attachments/assets/39fbd0e7-88c7-49cf-b7f2-bed9a95bd9a8" /></td>
        </tr>
        <tr>
            <td><code>outline</code></td>
            <td><img width="1717" height="120" alt="material_outline_modernz" src="https://github.com/user-attachments/assets/baf38eaf-c481-4822-8a90-8c0720fbcb42" /></td>
        </tr>
    </tbody>
</table>

### Colors

Not a fan of white buttons and text? You have complete control to customize colors to perfectly reflect your style.

<table>
    <thead>
        <tr>
            <th>Colors</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><img width="1717" height="108" alt="modernz_colors_top" src="https://github.com/user-attachments/assets/5367e5c6-4c2e-4eb9-9ff8-44496629945e" /></td>
        </tr>
        <tr>
            <td><img width="1717" height="190" alt="modernz_colors_bottom" src="https://github.com/user-attachments/assets/1f82250a-58af-4097-9ad6-f6e5d784d16b" /></td>
        </tr>
    </tbody>
</table>

See the [Color Customization](docs/USER_OPTS.md#colors-and-style) section in the configuration guide for details on how to customize colors and buttons.

## Installation

1. **Disable Stock OSC**

   - Add `osc=no` in your `mpv.conf`
   - (OPTIONAL) Add `title-bar=no` in your `mpv.conf` for a clean look without the native operating system top bar

2. **Copy Files**

   - Place [`modernz.lua`](/modernz.lua) in your mpv `scripts` directory
   - Place [`modernz-icons.ttf`](/modernz-icons.ttf) in your mpv `fonts` directory
   - (OPTIONAL) Place [`modernz-locale.json`](/extras/locale/modernz-locale.json) in your mpv `script-opts` directory
   - (OPTIONAL) Place `thumbfast.lua` in your mpv `scripts` directory

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
│   └── 📄 modernz-icons.ttf
├── 📁 script-opts/
│   ├── 📄 modernz.conf
│   └── 📄 modernz-locale.json (optional)
└── 📁 scripts/
    ├── 📄 modernz.lua
    └── 📄 thumbfast.lua (optional)
```

## Configuration

- Place `modernz.conf` in the `/script-opts` folder to customize settings

   - Download [modernz.conf](./modernz.conf) with all default options

- Alternatively, you can create a short configuration of the options you want changed only:

```EditorConfig
# Short configuration example
# Seekbar color (hex format)
seekbarfg_color=#B7410E

# Interface options
speed_button=yes
title=${media-title}
icon_theme=fluent
icon_style=outline
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

1. **Download the locale pack**

Grab the [modernz-locale.json](/extras/locale/modernz-locale.json) file from this repository. This file holds translations for various languages.

2. **Add the locales to mpv**

Copy the downloaded `modernz-locale.json` file to your mpv's `/script-opts` folder.

3. **Choose your language**

4. Adjust or add the `language` option in `modernz.conf` file

```EditorConfig
# Example configuration in modernz.conf
# Set language to Simplified Chinese
language=zh
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
- Introduce a dedicated layout optimized for image viewing. [details](/docs/IMAGE_VIEWER.md)
- Add `modern` and `modern-compact` layouts and icon themes support
- Refactor the project to align with mpv’s stock OSC standards, ensuring long-term compatibility
- Remove legacy bugs and redundant code to improve maintainability and stability
  - This enables other `Modern` forks to build on ModernZ as a foundation
    - Such as [zydezu/ModernX](https://github.com/zydezu/ModernX) ([reference](https://github.com/zydezu/ModernX/releases/tag/0.3.9))

In essence, to maintain and revive the `modern-osc` origin.

Having said that, ModernZ still uses parts of the old code, and every previous and current fork author and contributor deserve credit (including mpv's stock osc), that is why they're mentioned in detail.

#### Credits:

- [Material Symbols](https://github.com/google/material-design-icons) by Google — [Apache 2.0](https://github.com/google/material-design-icons?tab=Apache-2.0-1-ov-file#readme)
- [Fluent System Icons](https://github.com/microsoft/fluentui-system-icons) by Microsoft — [MIT](https://github.com/microsoft/fluentui-system-icons?tab=MIT-1-ov-file#readme) *(some icons modified or created to suit the OSC's needs)*
- [mpv](https://github.com/mpv-player/mpv) and their [osc.lua](https://github.com/mpv-player/mpv/blob/master/player/lua/osc.lua), as ModernZ osc was re-based on the stock osc standards and applies updates from it
- All modern osc origin and their forks as mentioned in [history](#history)
- All [contributors](https://github.com/Samillion/ModernZ/graphs/contributors), testers and users that helped directly or indirectly with ModernZ osc ❤️
