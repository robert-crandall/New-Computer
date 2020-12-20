# Files to install tweaks and software to a new workstation
## How to use:
* Install Windows
  * Personal settings: Sign in with Local account; on first run, go to Accounts and "Sign in with Microsoft Account"
* Install https://github.com/microsoft/winget-cli/releases
* Open MS Store, search for App Installer
* Run Install-Computer.cmd as an Administrator
* Follow the prompts

## Post Installation Steps

* Verify personalizations done
  * If not, run the second-run file
  * Execution Policy might need to be adjusted
* Sign into apps
  * Chrome
  * Lastpass
* Git username/email
```
git config --global user.name "FIRST_NAME LAST_NAME"
git config --global user.email "MY_NAME@example.com"
```

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
