# ModernX-Lite
A lite version of [ModernX OSC](https://github.com/zydezu/ModernX) by zydezu for mpv to suit my usecase.

> [!CAUTION]
> This is still a work in progress.

![Preview](https://github.com/user-attachments/assets/f43d4c34-2746-40f8-9068-3cbea538a0bd)

# What makes this version lite?
The original one has many great additional features, mostly around watching online videos, which for my use case is not really needed. So I decided to create a lite version.

Initial changes: (Displayed in this [commit](https://github.com/Samillion/ModernX-Lite/commit/1fd04350069c20f0b1faa568e97c51b3e2907795))
- Remove youtube dislikes
- Remove youtube description
- Remove youtube comments
- Remove dynamic title (based on web video)
- Remove download video related options
- Remove altering window title
- Remove all unused functions, variables and parameters
- Apply relative patches from [mpv/osc.lua](https://github.com/mpv-player/mpv/blob/master/player/lua/osc.lua), going far back as mid 2022
- Start fixing indentations, gradually and periodically to avoid unexpected breakage

For a full list of changes [click here](https://github.com/Samillion/ModernX-Lite/commits/main/modernxlite.lua) [work in progress, always changing]
