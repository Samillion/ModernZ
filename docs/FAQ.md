# ModernZ FAQ
Answers to frequently asked questions and helpful guidelines. If you can't find what you're looking for here, feel free to [open an issue](https://github.com/Samillion/ModernZ/issues/new/choose).

## Frequent Requests
- Show a pause indicator: [details](/extras/pause-indicator-lite)
- Show a video quality menu when viewing online content: [details](https://github.com/Samillion/ModernZ/issues/515#issuecomment-4292144140)
- Open file, add subtitle or add an audio track directly from mpv: [details](/extras/open-file)

## Personalized Requests
You can usually achieve this by implementing an auto profile in your `mpv.conf` that applies specific ModernZ user options in certain scenarios.

**Auto-profile examples:**
- [PIP mode](/extras/pip-lite) (Picture-in-Picture)
- [Image viewer mode](/docs/IMAGE_VIEWER.md#recommended)
- [Custom options](/docs/USER_OPTS.md#auto-profile) for specific scenarios (e.g., fullscreen)

## Issues or Bug Reports
- ModernZ is compatible with the latest mpv builds—please update mpv to check if the issue persists.
- Search both open and closed issues to see if the problem has already been reported or resolved.
- Ensure the issue cannot be reproduced using mpv's stock OSC.
- When submitting a bug report, include a log file with the issue reproduced so we can investigate effectively:
  - Log file: `mpv sample.mp4 --log-file=output.txt` [[details](https://mpv.io/manual/master/#options-log-file)]
  - Attach the log file—do not paste its contents into the issue.
  - Describe the issue in as much detail as possible, ideally including exact steps to reproduce it.

## Feature Requests
Many features and options have already been added compared to the original `modern` OSC, as shown on the [features](/#features) and [user options](/docs/USER_OPTS.md) pages.

At this point, we are more selective about adding new options, features, or changing OSC behavior. Adding too many can become overwhelming for both users and maintainers.

That said, we are still open to new ideas—we just aim to keep things practical and broadly useful rather than tailored to very specific use cases.

## Useful Links
- [ModernZ controls manual](/docs/CONTROLS.md)
- [ModernZ user options manual](/docs/USER_OPTS.md) 
- [ModernZ translations and locales](/docs/TRANSLATIONS.md)
- [ModernZ extra scripts](/#extras)
- [ModernZ history](/#history)
- [mpv manual](https://mpv.io/manual/master/)

Thank you.
