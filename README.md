## ModernX-Lite
A lite version of [zydezu/ModernX OSC](https://github.com/zydezu/ModernX) for mpv to match my usecase, which is usually a simple one. I prefer a modular approach (scripts), than having it all in one basket.

> [!CAUTION]
> This is still a work in progress.

![Preview](https://github.com/user-attachments/assets/f43d4c34-2746-40f8-9068-3cbea538a0bd)

## What makes this lite?
The one I forked from has many great additional features, mostly relating to online videos, which for my use case is not really needed. So I decided to create a lite version.

### Initial changes: ([commit](https://github.com/Samillion/ModernX-Lite/commit/1fd04350069c20f0b1faa568e97c51b3e2907795))
- Removed youtube dislikes
- Removed youtube description
- Removed youtube comments
- Removed dynamic osc title (based on web video metadata)
- Removed download video related options
- Removed altering window title
- Removed all unused functions, variables and parameters
- Applied relative patches from [mpv/osc.lua](https://github.com/mpv-player/mpv/blob/master/player/lua/osc.lua), going far back as mid 2022
- Started fixing indentations, gradually and periodically to avoid unexpected breakage

For a full list of changes [click here](https://github.com/Samillion/ModernX-Lite/commits/main/modernxlite.lua) [work in progress, always changing]

## How to install
Simply place `modernxlite.lua` in the corresponding mpv scripts folder of your operating system:

**Fonts**: Place `Material-Design-Iconic-Font.ttf` and `Material-Design-Iconic-Round.ttf` in the `fonts` folder.

**Configuration**: To adjust some attributes, such as seek color, place `modernxlite.conf` in the `script-opts` folder

**Thumbfast**: This OSC supports `thumfast.lua`, nothing additional needs to be done to activate it.

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
> More information about files locations can be found  [here](https://mpv.io/manual/master/#files)

## Configuration File
An example of `modernxlite.conf` with default values: (For a full list, see `user_opts` in `modernxlite.lua`)

```properties
# show the mpv 'play files' screen upon open
welcomescreen=yes

# whether to show OSC window controls, 'auto', 'yes' or 'no'
windowcontrols=auto

# show OSC when windowed?
showwindowed=yes

# show OSC when fullscreen?
showfullscreen=yes

# disable santa hat in December?
noxmas=no

# register keybindings i.e. chapter scrubbing, pinning window
keybindings=no
    
# whether to scale the controller with the video
vidscale=yes

# duration in ms until OSC hides if no mouse movement
hidetimeout=2500

# whether to show to osc when paused
showonpause=yes

# whether to disable the hide timeout on pause
donttimeoutonpause=yes

# if the osc should only display when hovering at the bottom
bottomhover=yes

# whether to raise subtitles above the osc when it's shown
raisesubswithosc=yes

# always show a small progress line at the bottom of the screen
persistentprogress=no

# on web videos, show the buffer on the persistent progress line
persistentbuffer=no

# show title in OSC (above seekbar)
showtitle=yes

# title shown on OSC (above seekbar), ${media-title} or ${filename}
title=${media-title}

# the font size of the title text
titlefontsize=30

# accent of the OSC and the title bar, in Hex color format
osc_color=#000000

# color of the seekbar progress and handle, in Hex color format
seekbarfg_color=#B7410E

# color of the remaining seekbar, in Hex color format
seekbarbg_color=#FFFFFF

# icon style, 'solid' or 'round'
iconstyle=round

# whether buttons have a glowing effect when hovered over
hovereffect=yes

# change the jump amount (in seconds by default)
jumpamount=10

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

# activate looping by right clicking pause
loopinpause=yes

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

I convinced myself that this was a good decision because: The one I forked is the most recently maintained one, compared to the original. That means less work, even though I had to apply `mpv/osc.lua` patches as far back as 2022. :satisfied:

Still, all the people there deserve credit for their great work.
