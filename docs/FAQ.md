# ModernZ FAQ
Answers for frequently asked questions and helpful guidelines that might be useful to you. If you can't find your answer here, don't heistate to [open an issue](https://github.com/Samillion/ModernZ/issues/new/choose).

## Personalized requests
You can most likely achieve this by implementing an auto profile in your `mpv.conf` that applies specific ModernZ user options in certain or specific scenarios.

**Auto-profile examples:**
- [Custom fullscreen](https://github.com/Samillion/ModernZ/issues/206#issuecomment-2470315786)
- [PIP mode](https://github.com/Samillion/ModernZ/tree/main/extras/pip-lite) (Picture-in-Picture)
- [Image viewer mode](https://github.com/Samillion/ModernZ/blob/main/docs/IMAGE_VIEWER.md#recommended)
- [Custom mode](https://github.com/Samillion/ModernZ/blob/main/docs/USER_OPTS.md#auto-profile)

## Issues or bug reports
- ModernZ is compatible with the latest mpv builds, please make sure to update your mpv to see if the issue persists
- Search open and closed issues to see if it has been posted before and resolved or not
- Make sure that the issue cannot be reproduced on mpv's stock OSC
- When posting a bug report, please include a log file with the issue reproduced so we can track the issue the best we can.
  - Log file: `mpv sample.mp4 --log-file=output.txt` [[details](https://mpv.io/manual/master/#options-log-file)]
  - Attach the log file, do not paste the text within the issue
  - Describe the issue in detail as much as you can, preferably with exact steps on how to re-produce the issue.

## Feature requests
Many features and options were added compared to the `modern` origin osc, as shown in [features](/#features) and [user options](/docs/USER_OPTS.md) page.

We have reached a point that we've become very picky on adding new options, features or adjusting osc behavior, as it can be overwhelming for both users and maintainers if too many were added or adjusted.

That doesn't mean we won't add anything new, it just means that we're trying to be practical and realistic. Whether the change will benefit all, or a very specific use case.

## Useful links
- [ModernZ controls manual ](/docs/CONTROLS.md)
- [ModernZ user options manual](/docs/USER_OPTS.md) 
- [ModernZ translations and locales](/docs/TRANSLATIONS.md)
- [ModernZ extra scripts](/#extras)
- [ModernZ history](/#history)
- [mpv manual](https://mpv.io/manual/master/)

Thank you.
