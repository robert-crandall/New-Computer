:: Run this in an admin CMD window

<# : Begin batch (batch script is in commentary of powershell v2.0+)
@echo off
: Use local variables
setlocal
: Change current directory to script location - useful for including .ps1 files
cd %~dp0
: Invoke this file as powershell expression
@powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin
powershell -executionpolicy bypass -Command "Invoke-Expression $([System.IO.File]::ReadAllText('%~f0'))"
: Restore environment variables present before setlocal and restore current directory
endlocal
: End batch - go to end of file
goto:eof
#>


## Concat Boxstarter files to a local file

  #Rename the computer
  Rename-Computer -NewName "Roberts-iMac"

 $BoxstarterFile = "C:\tools\Chocolatey-install.ps1"


  # Create tools directory if Boxstarter didn't already
  if((Test-Path -Path $BoxstarterFile )){
    Remove-Item -path $BoxstarterFile
  }
  New-Item -path $BoxstarterFile -type file -force

  # List of sources for this machine
  $sources = @("https://raw.githubusercontent.com/iRobie/New-Computer/master/src/processes/initialize.txt",
  "https://raw.githubusercontent.com/iRobie/New-Computer/master/src/install-lists/Basic-Computer.txt",
  "https://raw.githubusercontent.com/iRobie/New-Computer/master/src/install-lists/Personal-Base.txt",
  "https://raw.githubusercontent.com/iRobie/New-Computer/master/src/install-lists/Personal-WHSFront.txt",
  "https://raw.githubusercontent.com/iRobie/New-Computer/master/src/install-lists/Personal-Bootcamp-iMac.txt",
  "https://raw.githubusercontent.com/iRobie/New-Computer/master/src/processes/finalize.txt"
  )

  # Generate boxstarter file
  foreach ($source in $sources)
  {
    add-content $BoxstarterFile -value ((new-object net.webclient).DownloadString($source))
  }

 
  # Run the install
  & "$BoxstarterFile"

## List of manual installs
# Dism /online /enable-feature /featurename:NetFx3 /All /Source:E:\sources\sxs /LimitAccess
# Intel Management Engine Interface
# Intel INF installation
# Intel® Rapid Storage Technology
# Nvidia driver
