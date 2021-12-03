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
  $computerName = Read-Host -Prompt 'Input your computer name'
  Rename-Computer -NewName $computerName

 $BoxstarterFile = "C:\tools\new-install.ps1"

  # Create tools directory if Boxstarter didn't already
  if((Test-Path -Path $BoxstarterFile )){
    Remove-Item -path $BoxstarterFile
  }
  New-Item -path $BoxstarterFile -type file -force


  # List of sources for this machine
  $sources = @("https://raw.githubusercontent.com/robert-crandall/New-Computer/master/src/install-lists/Basic-Computer.txt"
  )
  
  $continue=$false

  Write-host "Is this a computer for you? No means for someone else (Default is No)" -ForegroundColor Yellow 
    $readhost = Read-Host " ( y / n ) " 
    Switch ($ReadHost) 
     { 
       Y {
         $continue=$true
         Write-host "Getting personal lists"; 
         $sources += "https://raw.githubusercontent.com/robert-crandall/New-Computer/master/src/install-lists/Personal-Base.txt"
         } 
      Default {Write-Host "No, stopping other prompts"} 
     } 

     if ($continue)
     {
        Write-host "Is this a computer for media editing? (Default is no)" -ForegroundColor Yellow 
          $readhost = Read-Host " ( y / n ) " 
          Switch ($ReadHost) 
          { 
            Y {
              Write-host "Getting media lists"; 
              $sources += "https://raw.githubusercontent.com/robert-crandall/New-Computer/master/src/install-lists/Personal-Media.txt"
              } 
            Default {Write-Host "Skipping media lists"} 
          } 

        Write-host "Is this a computer for an Office? (Default is no)" -ForegroundColor Yellow 
          $readhost = Read-Host " ( y / n ) " 
          Switch ($ReadHost) 
          { 
            Y {
              Write-host "Getting engineering lists"; 
              $sources += "https://raw.githubusercontent.com/robert-crandall/New-Computer/master/src/install-lists/Personal-Office.txt"
              } 
            Default {Write-Host "Skipping engineering lists"} 
          } 

        Write-host "Is this a computer for development? (Default is no)" -ForegroundColor Yellow 
          $readhost = Read-Host " ( y / n ) " 
          Switch ($ReadHost) 
          { 
            Y {
              Write-host "Getting development lists"; 
              $sources += "https://raw.githubusercontent.com/robert-crandall/New-Computer/master/src/install-lists/Personal-Development.txt"
              } 
            Default {Write-Host "Skipping development lists"} 
          } 

          Write-host "Is this a computer for gaming? (Default is no)" -ForegroundColor Yellow 
          $readhost = Read-Host " ( y / n ) " 
          Switch ($ReadHost) 
          { 
            Y {
              Write-host "Getting gaming lists"; 
              $sources += "https://raw.githubusercontent.com/robert-crandall/New-Computer/master/src/install-lists/Personal-Gaming.txt"
              } 
            Default {Write-Host "Skipping gaming lists"} 
          } 
	  
	  Write-host "Last Question: Install Windows Subsystem Linux? (Default is no)" -ForegroundColor Yellow 
          $readhost = Read-Host " ( y / n ) " 
          Switch ($ReadHost) 
          { 
            Y {
	      Write-host "Getting WSL lists"; 
              $sources += "https://raw.githubusercontent.com/robert-crandall/New-Computer/master/src/install-lists/Personal-WSL.txt"
	       } 
            Default {Write-Host "Skipping WSL"} 
          } 

          Write-host "Finally, getting finalize list"; 
              $sources += "https://raw.githubusercontent.com/robert-crandall/New-Computer/master/src/processes/finalize.txt"
			  
              
          $sources += "https://raw.githubusercontent.com/robert-crandall/New-Computer/master/src/install-lists/Personal-Settings.txt"

     } # If continue

  # Generate boxstarter file
  foreach ($source in $sources)
  {
    add-content $BoxstarterFile -value ((new-object net.webclient).DownloadString($source))
  }
   
  # Run the install
  powershell.exe -NoProfile -ExecutionPolicy Bypass -File "$BoxstarterFile"

  # Output any errors
  $DesktopPath = [Environment]::GetFolderPath("Desktop")
  Select-String -Path C:\ProgramData\chocolatey\logs\choco.summary.log -pattern "\[ERROR\]" -AllMatches | Foreach {$_.Line} > $DesktopPath\chocolatey_errors.log

## List of manual installs
# Dism /online /enable-feature /featurename:NetFx3 /All /Source:E:\sources\sxs /LimitAccess
# Intel Management Engine Interface
# Intel INF installation
# Intel® Rapid Storage Technology
# Nvidia driver