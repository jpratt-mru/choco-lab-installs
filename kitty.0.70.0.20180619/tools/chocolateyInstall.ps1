$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

Get-ChocolateyUnzip "$toolsDir\kitty.7z" $toolsDir

Add-ShortcutToStartMenu "C:\ProgramData\chocolatey\bin\kitty_portable.exe" "INS" 0 "-load INS"