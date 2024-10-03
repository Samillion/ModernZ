## ModernZ
A fork of [zydezu/ModernX OSC](https://github.com/zydezu/ModernX) for mpv. ModernZ could be considered a lite version, since it strips many web features, but also the purpose is to re-do the project and follow mpv's OSC standards, while keeping a modern look.

> [!CAUTION]
> This is still a work in progress.

![Preview](https://github.com/user-attachments/assets/514399b3-f1c6-493f-ac7e-66c5a7ac083a)


## What's different in ModernZ?
The one I forked from has many great additional features, mostly relating to online videos, which for my use case is not really needed. So I decided to create this version.

### Changes: (commits: [initial](https://github.com/Samillion/ModernX-Lite/commit/1fd04350069c20f0b1faa568e97c51b3e2907795) - [major](https://github.com/Samillion/ModernX-Lite/commit/9dbc3fe04914317df9a7e979ed756bb344ef3ed5))
- Removed youtube dislikes
- Removed youtube description
- Removed youtube comments
- Removed dynamic osc title (based on web video metadata)
- Removed download video related options
- Removed altering window title
- Removed all unused functions, variables and parameters
- Applied relative patches from [mpv/osc.lua](https://github.com/mpv-player/mpv/blob/master/player/lua/osc.lua), going far back as mid 2022

These changes might introduce bugs. It shouldn't, but it's always possible. If found, please open an issue.

For a full list [click here](https://github.com/Samillion/ModernX-Lite/commits/main/modernxlite.lua) and [here](https://github.com/Samillion/ModernZ/commits/main/modernz.lua)

### To do list:
- [x] Re-organize the functions and variables so the order makes sense and not just random
- [ ] Ensure all included functions and variables are actually used and not remnants of the past
- [ ] Match mpv's `osc.lua` standards and functionality, where relative, to ensure compatibility and stability.
- [ ] Improve button placements
- [ ] Include more customization options for colors

## How to install
**OSC**: Simply place `modernz.lua` in the corresponding mpv scripts folder of your operating system:

**Fonts**: Place `Material-Design-Iconic-Font.ttf` and `Material-Design-Iconic-Round.ttf` in the `fonts` folder.

**Configuration**: To adjust options, such as seek color, place `modernz.conf` in the `script-opts` folder

**Thumbfast**: This OSC supports [thumbfast](https://github.com/po5/thumbfast). No additional steps needed, just place it in the `scripts` folder.

```
conf/mpv
│
├───fonts
│       Material-Design-Iconic-Font.ttf
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

## History
- [Samillion/ModernZ](https://github.com/Samillion/ModernZ)
	- forked from [zydezu/ModernX](https://github.com/zydezu/ModernX)
		- forked from [dexeonify/ModernX](https://github.com/dexeonify/mpv-config/blob/main/scripts/modernx.lua)
			- forked from [cyl0/ModernX](https://github.com/cyl0/ModernX)
				- forked from [maoiscat/mpv-osc-modern](https://github.com/maoiscat/mpv-osc-modern)

Looking at the fork history of `ModernX`, I asked myself:
> Since you forked this, doesn't that mean you stripped it back down to be a near match of the original?

Absolutely, yes. :stuck_out_tongue_closed_eyes:

The caviat here is that I only asked myself that after the fact.

After arguing with myself, I concluded: The main idea is to re-do the project to keep mpv's OSC standards for functionality and compatibility. It's a nice side project that is teaching me a lot about mpv and lua.

Still, all the people there deserve credit for their great work.
