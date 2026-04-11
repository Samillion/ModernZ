<h1 align="center">ModernZ - A Sleek Alternative OSC for mpv</h1>

A sleek and modern OSC for [mpv](https://mpv.io/). This project is a fork of ModernX that enhances functionality by adding more features while preserving the core standards of mpv's OSC.

<img width="1715" height="966" alt="ModernZ" src="https://github.com/user-attachments/assets/a2c8081e-2909-4bd1-872d-c59c48e76302" />

<p align="center">
  <a href="#installation"><strong>Installation »</strong></a><br>
  <a href="#configuration">Configuration</a> ·
  <a href="#controls">Controls</a> ·
  <a href="#translations">OSC Language</a> ·
  <a href="#extras">Extra Scripts</a>
</p>

## Features

- 🎨 Modern, customizable interface with multiple layouts, themes, and icon styles [[options](#configuration)]
- 🖱️ Independent hover zone for top bar (window controls) and bottom bar (OSC)
- 📷 Image Viewer mode with zoom controls [[details](/docs/IMAGE_VIEWER.md)]
- 🎛️ Buttons: download, playlist, speed control, screenshot, pin, loop, cache, and more. [[details](/docs/CONTROLS.md)]
- 📄 Interactive menus for playlist, subtitles, chapters, audio tracks, and audio devices
- 🌐 Multi-language support with JSON [locale](#translations) integration
- ⌨️ Configurable controls [[details](#controls)]
- 🖼️ Video thumbnail previews with [thumbfast](https://github.com/po5/thumbfast)

<a href="/docs/INTERACTIVE_MENUS.md">
    <img width="350" alt="preview_features_button_md" src="https://github.com/user-attachments/assets/f7914071-0690-45ed-b1cf-6ced74f3a8e3" />
</a>

## Customization
Choose the layout that suits your preference (`modern` or `modern-compact`) using the `layout` option in your `modernz.conf`.

### Layouts

<table>
    <thead>
        <tr>
            <th><code>modern</code></th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><img width="1715" height="120" alt="modernz_modern_layout" src="https://github.com/user-attachments/assets/97791b5b-e7c8-47bc-8805-a286052762f6" /></td>
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
            <td><img width="1715" height="150" alt="modernz_compact_layout" src="https://github.com/user-attachments/assets/b88f7823-b328-427e-8720-c2d4ab2c496a" /></td>
        </tr>
    </tbody>
</table>

### Themes

You can also change the icon theme to `fluent` or `material` to match your preferred style by using the `icon_theme` option in your `modernz.conf`.

<table>
    <thead>
        <tr>
            <th><code>fluent</code></th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><img width="1715" height="120" alt="modernz_fluent_theme" src="https://github.com/user-attachments/assets/9c0172db-f959-4c95-a31f-aab55290f5ec" /></td>
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
            <td><img width="1715" height="120" alt="modernz_material_theme" src="https://github.com/user-attachments/assets/cc532cd8-32aa-4dba-93eb-5f8f599ea654" /></td>
        </tr>
    </tbody>
</table>

### Theme Styles

Both `fluent` and `material` themes have different styles as well. By using the `icon_style` option, you can choose `mixed`, `filled`, or `outline`.

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
            <td><img width="1715" height="120" alt="modernz_fluent_mixed" src="https://github.com/user-attachments/assets/58774224-1fd2-4939-8263-b14bba551be0" /></td>
        </tr>
        <tr>
            <td><code>filled</code></td>
            <td><img width="1715" height="120" alt="modernz_fluent_filled" src="https://github.com/user-attachments/assets/c0beee55-b6c8-4bef-a192-0b529c1ecea9" /></td>
        </tr>
        <tr>
            <td><code>outline</code></td>
            <td><img width="1715" height="120" alt="modernz_fluent_outline" src="https://github.com/user-attachments/assets/5c6af748-1f4e-46e6-b6b9-470954e93ef8" /></td>
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
            <td><img width="1715" height="120" alt="modernz_material_mixed" src="https://github.com/user-attachments/assets/2518a9f6-8a07-499c-912d-a527535d6ff1" /></td>
        </tr>
        <tr>
            <td><code>filled</code></td>
            <td><img width="1715" height="120" alt="modernz_material_filled" src="https://github.com/user-attachments/assets/c14f94f3-0564-4ef8-b46a-6e1edb75556c" /></td>
        </tr>
        <tr>
            <td><code>outline</code></td>
            <td><img width="1715" height="120" alt="modernz_material_outline" src="https://github.com/user-attachments/assets/d1e12ff2-a4bb-4956-9049-821fe243ad93" /></td>
        </tr>
    </tbody>
</table>

### Seek Bar

If you find the seek bar too thin or too thick, you can easily adjust its size using the `seekbar_height` option. Available values include `small`, `medium` (default), `large`, and `xlarge`.

<table>
    <tr>
        <th><code>small</code></th>
        <th><code>medium</code> (Default)</th>
    </tr>
    <tr>
        <td>
            <img width="500" height="110" alt="seekbar_small" src="https://github.com/user-attachments/assets/749e6ee9-8964-45bd-841e-8e14510b1805" />
        </td>
        <td>
            <img width="500" height="110" alt="seekbar_medium" src="https://github.com/user-attachments/assets/6ed7aa8f-0f66-436c-bc71-04f5e38d89da" />
        </td>
    </tr>
    <tr>
        <th><code>large</code></th>
        <th><code>xlarge</code></th>
    </tr>
    <tr>
        <td>
            <img width="500" height="110" alt="seekbar_large" src="https://github.com/user-attachments/assets/282ba6a8-d33a-4f10-a431-c90a6245883d" />
        </td>
        <td>
            <img width="500" height="110" alt="seekbar_xlarge" src="https://github.com/user-attachments/assets/49b2cafb-ac82-47fa-b0fb-176fbc1942d5" />
        </td>
    </tr>
</table>

### Chapter Markers
You can change the chapter markers style by using the `nibbles_style` option, which accepts: `gap`, `triangle`, `bar`, and `single-bar`

<table>
    <tr>
        <th><code>gap</code> (Default)</th>
        <th><code>triangle</code></th>
    </tr>
    <tr>
        <td>
            <img width="500" height="110" alt="chapter_gap" src="https://github.com/user-attachments/assets/c89cf611-36ec-4668-86ca-c4b4ebd73122" />
        </td>
        <td>
            <img width="500" height="110" alt="chapter_triangle" src="https://github.com/user-attachments/assets/2cfc504e-086c-4392-bab9-aff90b0fac0c" />
        </td>
    </tr>
    <tr>
        <th><code>bar</code></th>
        <th><code>single-bar</code></th>
    </tr>
    <tr>
        <td>
            <img width="500" height="110" alt="chapter_bar" src="https://github.com/user-attachments/assets/b609661d-8ec3-4146-ba3c-853dc802e64f" />
        </td>
        <td>
            <img width="500" height="110" alt="chapter_singlebar" src="https://github.com/user-attachments/assets/03696a4c-8dc5-44f6-8090-b27e01562526" />
        </td>
    </tr>
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
            <td><img width="1715" height="108" alt="modernz_colors_top" src="https://github.com/user-attachments/assets/b4f97def-df93-40ed-aa8e-d432e25c3230" /></td>
        </tr>
        <tr>
            <td><img width="1715" height="188" alt="modernz_colors_bottom" src="https://github.com/user-attachments/assets/4a40bb0b-7d4a-429c-add4-43a9c8aa511b" /></td>
        </tr>
    </tbody>
</table>

See the [Color Customization](/docs/USER_OPTS.md#colors-and-style) section in the configuration guide for details on how to customize colors and buttons.

## Installation

1. **Disable Stock OSC**

   - Add `osc=no` in your `mpv.conf`
   - (OPTIONAL) Add `title-bar=no` in your `mpv.conf` for a clean look without the native window top bar

2. **Copy Files**

   - Place `modernz.lua` in your mpv `scripts` directory
   - Place `modernz-icons.ttf` in your mpv `fonts` directory
   - (OPTIONAL) Place `modernz-locale.json` in your mpv `script-opts` directory
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

   - You could download `modernz.conf` with all the default options

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

For a full list of options, [check out the detailed list here](/docs/USER_OPTS.md).

## Controls

### Button Interactions

- Left click: Primary action
- Right click: Secondary action
- Middle click/Shift+Left click: Alternative action

> [!NOTE]
> Middle clicking performs the same function as `Shift+left mouse button`, allowing for one-handed use

For a full list of interactions, check out the [Button Interactions Guide](/docs/CONTROLS.md).

### Keybinds

ModernZ doesn't set keybinds by default to avoid interfering with your current setup. You can add keybinds in `input.conf` if you prefer:

```
v   script-binding modernz/visibility              # Cycle visibility modes
V   script-message-to modernz osc-visibility cycle # Set a visibility mode: cycle, auto, always, never
w   script-binding modernz/progress-toggle         # Toggle persistent progress
x   script-message-to modernz osc-show             # Show OSC
y   script-message-to modernz osc-hide             # Hide OSC
z   script-message-to modernz osc-idlescreen       # Toggle idle screen
```

## Translations

ModernZ is currently available in English, but you can easily switch it to your preferred language! Here's how:

1. **Download the locale pack**

Grab the [modernz-locale.json](/extras/locale/modernz-locale.json) file from this repository. This file holds translations for various languages.

2. **Add the locales to mpv**

Copy the downloaded `modernz-locale.json` file to your mpv `/script-opts` folder.

3. **Choose your language**

Adjust or add the `language` option in your `modernz.conf` to your preferred language.

```EditorConfig
# Example configuration in modernz.conf
# Set language to Simplified Chinese
language=zh
```

**Need More Info?**

For a complete list of available languages, contribution guidelines, and in-depth translation documentation, head over to the [TRANSLATIONS.md](/docs/TRANSLATIONS.md).

## Extras

The following scripts are maintained by me. Feel free to use them if they're useful to you.

- [Pause-Indicator-Lite](/extras/pause-indicator-lite) - A simple script that displays an indicator on pause
- [PiP-Lite](/extras/pip-lite) - Add a PiP mode (Picture-in-Picture) via the ModernZ pin button or when `ontop` is enabled
- [ytdlAutoFormat](https://github.com/Samillion/mpv-ytdlautoformat) - A simple mpv script to automatically change `ytdl-format` (yt-dlp) for specified domains
- [BoxtoWide](https://github.com/Samillion/mpv-boxtowide) - A simple mpv script to change the aspect-ratio of video files/streams to a specific target ratio automatically

For even more useful scripts, check out the [mpv User Scripts Wiki](https://github.com/mpv-player/mpv/wiki/User-Scripts). It offers a wide range of community-contributed scripts to enhance your mpv experience.

## History

- [Samillion/ModernZ](https://github.com/Samillion/ModernZ)
  - forked from [dexeonify/ModernX](https://github.com/dexeonify/mpv-config/blob/main/scripts/modernx.lua)
    - forked from [cyl0/ModernX](https://github.com/cyl0/ModernX)
      - forked from [maoiscat/mpv-osc-modern](https://github.com/maoiscat/mpv-osc-modern)

**Why fork yet again?**

- Add extensive feature support, including [color customization](/docs/USER_OPTS.md#colors-and-style), advanced [options](/docs/USER_OPTS.md), and [locale integration](/docs/TRANSLATIONS.md)
- Integrate mpv's `console` and `select` functionality to OSC
  - An approach that later inspired adoption in mpv’s stock OSC ([#1](https://github.com/mpv-player/mpv/pull/15016), [#2](https://github.com/mpv-player/mpv/pull/15031))
- Introduce a dedicated layout optimized for image viewing. [details](/docs/IMAGE_VIEWER.md)
- Add `modern` and `modern-compact` layouts and icon themes support
- Refactor the project to align with mpv’s stock OSC standards, ensuring long-term compatibility
- Remove legacy bugs and redundant code to improve maintainability and stability
  - This enables other `Modern` forks to build on ModernZ as a foundation
    - Such as [zydezu/ModernX](https://github.com/zydezu/ModernX) ([reference](https://github.com/zydezu/ModernX/releases/tag/0.3.9))

In essence, to maintain and revive the `modern-osc` origin.

Having said that, ModernZ still uses parts of the old code, and every previous and current fork author and contributor deserves credit (including mpv's stock osc), which is why they are mentioned in detail.

#### Credits:

- [Material Symbols](https://github.com/google/material-design-icons) by Google — [Apache 2.0](https://github.com/google/material-design-icons?tab=Apache-2.0-1-ov-file#readme)
- [Fluent System Icons](https://github.com/microsoft/fluentui-system-icons) by Microsoft — [MIT](https://github.com/microsoft/fluentui-system-icons?tab=MIT-1-ov-file#readme) *(some icons modified or created to suit the OSC's needs)*
- [mpv](https://github.com/mpv-player/mpv) and their [osc.lua](https://github.com/mpv-player/mpv/blob/master/player/lua/osc.lua), as ModernZ osc was re-based on the stock osc standards and applies updates from it
- All modern osc origin and their forks as mentioned in [history](#history)
- All [contributors](https://github.com/Samillion/ModernZ/graphs/contributors), testers and users that helped directly or indirectly with ModernZ osc ❤️
