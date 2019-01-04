:: Run this in an admin CMD window
:: Run this file if the first installation did not successfuly run personalizations

<# : Begin batch (batch script is in commentary of powershell v2.0+)
@echo off
: Use local variables
setlocal
: Change current directory to script location - useful for including .ps1 files
cd %~dp0
: Invoke this file as powershell expression
powershell -executionpolicy bypass -Command "Invoke-Expression $([System.IO.File]::ReadAllText('%~f0'))"
: Restore environment variables present before setlocal and restore current directory
endlocal
: End batch - go to end of file
goto:eof
#>


$secondRunFile = "C:\tools\personalization.ps1"
 
# Run the install
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "$secondRunFile"
