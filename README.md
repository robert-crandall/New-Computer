# Files to install tweaks and software to a new workstation
## How to use:
* Run Install-Computer.cmd as an Administrator
* Follow the prompts

## Post Installation Steps

* Verify personalizations done (Cortana search and Onedrive missing)
  * If not, run the second-run file
  * Execution Policy might need to be adjusted
* Sign into apps
  * Chrome
  * Lastpass
  * Dropbox

## Gotchas
### Slow Start Menu
```
This seems to be fixed in 1809 build
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
