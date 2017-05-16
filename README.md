# Files to install tweaks and software to a new workstation
## How to use:
* Run Install-Computer.cmd as an Administrator
* Follow the prompts

## Gotchas
### Slow Start Menu
```
Manual fix for now.
Start -> Settings -> Personalization -> Start
Disable
- Show more tiles
- Occasionally show suggestions in Start
- Show recently added apps
- Use full screen
```
### Physical Hardware Installs
```
Dism /online /enable-feature /featurename:NetFx3 /All /Source:E:\sources\sxs /LimitAccess
Intel Management Engine Interface
Intel INF installation
Intel® Rapid Storage Technology
Nvidia driver
```

### Themes
Windows Store is hard to search for themes.
* Check here: http://themepack.me/category/nature/
* http://themepack.me/theme/yosemite/
* http://themepack.me/theme/forest/
* http://themepack.me/theme/bing/
