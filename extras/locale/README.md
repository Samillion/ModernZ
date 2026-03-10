## Locales

ModernZ is currently available in English, but you can easily switch it to your preferred language! Here's how:

1. **Download the locale pack:**

Grab the [modernz-locale.json](/extras/locale/modernz-locale.json) file from this repository. This file holds translations for various languages.

2. **Add the locales to mpv:**

Copy the downloaded `modernz-locale.json` file to your mpv's `/script-opts` folder.

3. **Choose your language:**

4. Adjust or add the `language` option in `modernz.conf` file

```ini
# Example configuration in modernz.conf
# Set language to Simplified Chinese
language=zh
```

**Folder Structure** [[mpv manual](https://mpv.io/manual/master/#files)]
```
📁 mpv/
└── 📁 script-opts/
    ├── 📄 modernz.conf
    └── 📄 modernz-locale.json
```

For more information: [Translations](/docs/TRANSLATIONS.md)
