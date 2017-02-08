## Concat Boxstarter files to a local file
# Run this first:
# set-executionpolicy unrestricted
# iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex

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
  "https://raw.githubusercontent.com/iRobie/New-Computer/master/src/install-lists/Personal-Engineer.txt",
  "https://raw.githubusercontent.com/iRobie/New-Computer/master/src/processes/finalize.txt"
  )

  # Generate boxstarter file
  foreach ($source in $sources)
  {
    add-content $BoxstarterFile -value ((new-object net.webclient).DownloadString($source))
  }

 
