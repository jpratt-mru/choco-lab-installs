$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

Get-ChocolateyUnzip "$toolsDir\pageant.7z" $toolsDir

Add-ShortcutToStartMenu "C:\ProgramData\chocolatey\bin\pageant.exe" "Pageant"


