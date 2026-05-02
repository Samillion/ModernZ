<h1 align="center">ModernZ - A Sleek Alternative OSC for mpv</h1>

A sleek and modern OSC for [mpv](https://mpv.io/). This project is a fork of ModernX that enhances functionality by adding more features while preserving the core standards of mpv's OSC.

![modernz_preview](https://github.com/user-attachments/assets/69a967ae-cf8a-4a92-9193-4799f901cd94)

<p align="center">
  <a href="#installation"><strong>Installation »</strong></a><br>
  <a href="#configuration">Configuration</a> ·
  <a href="#controls">Controls</a> ·
  <a href="#translations">OSC Language</a> ·
  <a href="#extras">Extra Scripts</a>
</p>

## Features

- 🎨 Modern, customizable interface with multiple layouts, themes, and icon styles [[options](#customization)]
- 🖱️ Independent hover zone for top bar (window controls bar) and bottom bar (OSC)
- 📷 Image Viewer mode with zoom controls [[details](/docs/IMAGE_VIEWER.md)]
- 🎛️ Buttons: download, playlist, speed control, screenshot, pin, loop, shuffle, and more. [[details](/docs/CONTROLS.md)]
- 📄 Interactive menus for playlist, subtitles, chapters, audio tracks, and audio devices
- 🌐 Multi-language support with JSON [locale](#translations) integration
- ⌨️ Configurable controls [[details](#controls)]
- 🖼️ Video thumbnail previews with [thumbfast](https://github.com/po5/thumbfast)

<a href="/docs/INTERACTIVE_MENUS.md">
    <img width="350" alt="preview_features_button_md" src="https://github.com/user-attachments/assets/f7914071-0690-45ed-b1cf-6ced74f3a8e3" />
</a>

## Customization
ModernZ provides a wide range of customization options, including multiple layouts, themes, icon styles, color adjustments, and much more.

### Layouts
Choose the layout that suits your preference using the `layout` option in your `modernz.conf`, which accepts: `default`, `compact`, `mini`, and `seekbar`

<table>
    <thead>
        <tr>
            <th><code>default</code></th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><img width="1961" height="125" alt="layout_default" src="https://github.com/user-attachments/assets/afa29219-d3ea-490b-bf34-530a9ba212a4" /></td>
        </tr>
    </tbody>
</table>
<table>
    <thead>
        <tr>
            <th><code>compact</code></th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><img width="1961" height="125" alt="layout_compact" src="https://github.com/user-attachments/assets/6a51fd86-5ed0-4162-9991-8edad2250221" /></td>
        </tr>
    </tbody>
</table>
<table>
    <thead>
        <tr>
            <th><code>mini</code></th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><img width="1961" height="125" alt="layout_mini" src="https://github.com/user-attachments/assets/a4f5d467-0286-4280-b284-9aaec8e6e42f" /></td>
        </tr>
    </tbody>
</table>
<table>
    <thead>
        <tr>
            <th><code>seekbar</code></th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><img width="1961" height="124" alt="layout_seekbar" src="https://github.com/user-attachments/assets/4479b9d3-cdfb-4ebb-ac85-8d4c8ba101e1" /></td>
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
            <td><img width="1961" height="125" alt="theme_fluent" src="https://github.com/user-attachments/assets/0fb0580c-6389-4427-8f23-e71ac1092aca" /></td>
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
            <td><img width="1961" height="125" alt="theme_material" src="https://github.com/user-attachments/assets/95d2ebd6-b87d-4170-8faa-cb7112c3482a" /></td>
        </tr>
    </tbody>
</table>

### Icon Styles

Both `fluent` and `material` themes have different icon styles as well. By using the `icon_style` option, you can choose `mixed`, `filled`, or `outline`.

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
            <td><img width="1961" height="125" alt="icon_style_fluent_mixed" src="https://github.com/user-attachments/assets/ce59d30d-adcf-4961-b153-4711a7bc12c6" /></td>
        </tr>
        <tr>
            <td><code>filled</code></td>
            <td><img width="1961" height="125" alt="icon_style_fluent_filled" src="https://github.com/user-attachments/assets/a5047c68-c8be-43c9-9c5a-c12dbeeb916f" /></td>
        </tr>
        <tr>
            <td><code>outline</code></td>
            <td><img width="1961" height="125" alt="icon_style_fluent_outline" src="https://github.com/user-attachments/assets/ce660cf4-b3f9-43a1-af92-fe2175a43bf6" /></td>
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
            <td><img width="1961" height="125" alt="icon_style_material_mixed" src="https://github.com/user-attachments/assets/3fb6730b-3ec2-4ce2-80e8-41faf2aced8c" /></td>
        </tr>
        <tr>
            <td><code>filled</code></td>
            <td><img width="1961" height="125" alt="icon_style_material_filled" src="https://github.com/user-attachments/assets/befe569c-ea72-42b4-a0f0-f189578a0df5" /></td>
        </tr>
        <tr>
            <td><code>outline</code></td>
            <td><img width="1961" height="125" alt="icon_style_material_outline" src="https://github.com/user-attachments/assets/8f28b937-d03c-4920-98c4-b69998989626" /></td>
        </tr>
    </tbody>
</table>

### Seek Bar

If you find the seek bar too thin or too thick, you can easily adjust its size using the `seekbar_height` option. Available values include `small`, `medium`, `large`, and `xlarge`.

<table>
    <tr>
        <th><code>small</code></th>
        <th><code>medium</code> (Default)</th>
    </tr>
    <tr>
        <td><img width="500" height="125" alt="seekbar_height_small" src="https://github.com/user-attachments/assets/d233d440-9915-4796-8cf7-5c9e85a0b27c" /></td>
        <td><img width="500" height="125" alt="seekbar_height_medium" src="https://github.com/user-attachments/assets/cbe7d65c-c35b-41c2-a66a-c57c09665e8d" /></td>
    </tr>
    <tr>
        <th><code>large</code></th>
        <th><code>xlarge</code></th>
    </tr>
    <tr>
        <td><img width="500" height="125" alt="seekbar_height_large" src="https://github.com/user-attachments/assets/a2d76a38-b25b-4501-b38c-707db8c5f16f" /></td>
        <td><img width="500" height="125" alt="seekbar_height_xlarge" src="https://github.com/user-attachments/assets/1542a3aa-e905-4c8a-a797-ee8841b33ca2" /></td>
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
        <td><img width="550" height="125" alt="chapter_marker_gap" src="https://github.com/user-attachments/assets/27d8e320-8df9-4f70-80a0-23f1e9116ac7" /></td>
        <td><img width="550" height="125" alt="chapter_marker_triangle" src="https://github.com/user-attachments/assets/cc8774b6-3271-496c-909b-b662c01f9ebb" /></td>
    </tr>
    <tr>
        <th><code>bar</code></th>
        <th><code>single-bar</code></th>
    </tr>
    <tr>
        <td><img width="550" height="125" alt="chapter_marker_bar" src="https://github.com/user-attachments/assets/1674d5fe-0aa7-4240-9b14-56077852b2ce" /></td>
        <td><img width="550" height="125" alt="chapter_marker_singlebar" src="https://github.com/user-attachments/assets/ef57c568-8421-48db-9dab-6f3bbb18da11" /></td>
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

- [Open-File](/extras/open-file/) - Open files, add subtitles, or add audio tracks directly from mpv via the Windows file dialog
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
