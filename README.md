## ModernX-Lite
A lite version of [zydezu/ModernX OSC](https://github.com/zydezu/ModernX) for mpv to match my usecase, which is usually a simple one. I prefer a modular approach (scripts), than having it all in one basket.

> [!CAUTION]
> This is still a work in progress.

![Preview](https://github.com/user-attachments/assets/514399b3-f1c6-493f-ac7e-66c5a7ac083a)


## What makes this lite?
The one I forked from has many great additional features, mostly relating to online videos, which for my use case is not really needed. So I decided to create a lite version.

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

For a full list [click here](https://github.com/Samillion/ModernX-Lite/commits/main/modernxlite.lua)

### To do list:
- [ ] Re-organize the functions and variables so the order makes sense and not just random
- [ ] Ensure all included functions and variables are actually used and not remnants of the past
- [ ] Improve button placements
- [ ] Include more customization options for colors
- [ ] Backward compatibility for mpv v0.36 and below

## How to install
**OSC**: Simply place `modernxlite.lua` in the corresponding mpv scripts folder of your operating system:

**Fonts**: Place `Material-Design-Iconic-Font.ttf` and `Material-Design-Iconic-Round.ttf` in the `fonts` folder.

**Configuration**: To adjust some attributes, such as seek color, place `modernxlite.conf` in the `script-opts` folder

**Thumbfast**: This OSC supports [thumbfast](https://github.com/po5/thumbfast). No additional steps needed, just place it in the `scripts` folder.

```
conf/mpv
│
├───fonts
│       Material-Design-Iconic-Font.ttf
│       Material-Design-Iconic-Round.ttf
│
├───script-opts
│       modernxlite.conf
│
└───scripts
        modernxlite.lua
        thumbfast.lua
```

> [!TIP]
> More information about files locations can be found [here](https://mpv.io/manual/master/#files)

## Configuration File
To customize options or colors, you can add `modernxlite.conf` in the `script-opts` folder, then add and change the options in there as you like.

An example of a `modernxlite.conf` file:

```properties
# For a full list of options, see user_opts in modernxlite.lua

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

# replace the jump buttons with the chapter buttons, clicking the
# buttons will act as jumping, and shift clicking will act as
# skipping a chapter
compactmode=no

# show the info button
showinfo=yes

# show the loop button
showloop=yes

# show window on top button
showontop=yes

# if you pin the window, remove window border?
ontopnoborder=yes

# show screenshot button
screenshotbutton=no
```

## Credits
- ModernX-Lite forked by Samillion: https://github.com/Samillion/ModernX-Lite
	- forked from zydezu/ModernX: https://github.com/zydezu/ModernX
		- forked from dexeonify: https://github.com/dexeonify/mpv-config/blob/main/scripts/modernx.lua
			- forked from cyl0: https://github.com/cyl0/ModernX
				- forked from maoiscat: https://github.com/maoiscat/mpv-osc-modern

Looking at the fork history of `ModernX`, I asked myself:
> Since you forked this, doesn't that mean you stripped it back down to be a near match of the original?

Absolutely, yes. :stuck_out_tongue_closed_eyes:

The caviat here is that I only asked myself that after the fact.

I convinced myself: The one I forked is the most recently maintained one, compared to the original. That means less work, even though I had to apply `mpv/osc.lua` patches as far back as 2022.

Still, all the people there deserve credit for their great work.
