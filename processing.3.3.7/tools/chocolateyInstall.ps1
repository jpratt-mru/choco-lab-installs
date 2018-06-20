$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

Get-ChocolateyUnzip "$toolsDir\processing-3.3.7.zip" $toolsDir

Add-ResourceForEveryUser "$toolsDir\Processing" "AppData\Roaming"

Add-ShortcutToStartMenu "C:\ProgramData\chocolatey\bin\processing.exe" "Processing"

