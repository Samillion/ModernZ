<h1 align="center">ModernZ - A Sleek Alternative OSC for mpv</h1>

A sleek and modern OSC for [mpv](https://mpv.io/), this project is a fork of ModernX designed to enhance functionality by adding more features, all while preserving the core standards of mpv's OSC.

![ModernZ OSC Screenshot](https://github.com/user-attachments/assets/57dc6e88-c222-4a62-b650-5ae6c88b4fc0)

<p align="center">
    <a href="#installation"><strong>Installation »</strong></a>
  <br>
  <a href="#configuration">Configuration</a>
  ·
  <a href="#controls">Controls</a>
  ·
  <a href="#interactive-lists">Interactive Lists</a>
  ·
  <a href="#translations">OSC Language</a>
  ·
  <a href="#extras">Extra Scripts</a>
</p>

## Features

- 🎨 Modern, customizable interface
- 🖼️ Video thumbnail previews on seek (with [thumbfast](https://github.com/po5/thumbfast))
- 📄 Interactive playlist and chapter lists
- 🌐 Multi-language support
- ⌨️ Configurable controls

## Customization Showcase

Don't like the default white buttons and text? ModernZ is fully customizable! Change colors and button layouts to match your style:

![Custom Titlebar Example](https://github.com/user-attachments/assets/7968b6f0-df16-44fd-8306-01e581b4e1a7)
![Custom Colors Example](https://github.com/user-attachments/assets/637f0c50-16ac-4d8c-a341-187e3d71d2d3)

See the [Color Customization](docs/USER_OPTS.md#colors) section in the configuration guide for details on how to customize colors and buttons.

## Installation

1. **Disable Stock OSC**
   - Add `osc=no` in your `mpv.conf`

2. **Copy Files**

   - Place `modernz.lua` in your mpv scripts directory
   - Place `Material-Design-Iconic-Round.ttf` in your mpv fonts directory
   - (OPTIONAL) Place `thumbfast.lua` in your mpv scripts directory

3. **Locations**

   ```
   Linux:   ~/.config/mpv/
   Windows: C:/Users/%username%/AppData/Roaming/mpv/
   macOS:   ~/Library/Application Support/mpv/
   ```

4. **Folder Structure**
   ```
   mpv/
   ├── fonts/
   │   └── Material-Design-Iconic-Round.ttf
   ├── script-opts/
   │   └── modernz.conf
   └── scripts/
   	   ├── modernz.lua
   	   └── thumbfast.lua (optional)
   ```
   > [!TIP]
   > Need more details on mpv file locations? Check the [mpv manual](https://mpv.io/manual/master/#files).

## Configuration

1. Create `modernz.conf` in the `/script-opts` folder to customize settings

   - [Download default modernz.conf](https://github.com/Samillion/ModernZ/blob/main/modernz.conf)

2. Example short configuration:

   ```ini
   # Seekbar colors (Hex format)
   seekbarfg_color=#B7410E

   # Interface colors
   text_color=#FFFFFF
   button_color=#B7410E

   # Interface options
   showplaylist=no
   title=${media-title}
   scalewindowed=1.0
   ```

For a full list of options, [check out the detailed user options here](docs/USER_OPTS.md).

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
w   script-binding modernz/progress-toggle     # Toggle progress bar
x   script-message-to modernz osc-show         # Show OSC
y   script-message-to modernz osc-visibility   # Toggle visibility
z   script-message-to modernz osc-idlescreen   # Toggle idle screen
```

## Interactive Lists

ModernZ supports mpv's built-in select.lua ([v0.39+](https://github.com/mpv-player/mpv/discussions/14903)) for playlist and chapter navigation.

https://github.com/user-attachments/assets/188992ba-1ad8-4d71-a96c-44c3c99df4e0

> [!TIP]
> If the font size for the interactive playlist is too small, you can add the following in your `mpv.conf`
>
> ```ini
> # change font size for console and select
> script-opts-append=console-font_size=25
> ```

## Translations

ModernZ is currently available in English, but you can easily switch it to your preferred language! Here's how:

**1. Download the locale pack:**

Grab the [modernz-locale.lua](/extras/locale/modernz-locale.lua) file from this repository. This file holds translations for various languages.

**2. Add the locales to mpv:**

Copy the downloaded `modernz-locale.lua` file to your mpv's `/scripts` folder.

**3. Choose our language:**

There are two ways to set your preferred language:

- **Recommended:** Use the `modernz.conf` file

  ```ini
  # Example configuration in modernz.conf
  language = "zh"  # Set language to Simplified Chinese
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

- [Pause Indicator](/extras/pause-indicator-lite) - A simple script that displays an indicator on pause

- [YTDLAutoFormat](https://github.com/Samillion/mpv-ytdlautoformat) - A simple mpv script to automatically change ytdl-format (yt-dlp) for specified domains/streams.

- [Box to Wide](https://github.com/Samillion/mpv-boxtowide) - A simple mpv script to change 4:3 aspect-ratio of video files/streams to 16:9 automatically.

For even more useful scripts, check out the [mpv User Scripts Wiki](https://github.com/mpv-player/mpv/wiki/User-Scripts). It offers a wide range of community-contributed scripts to enhance your mpv experience.

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
