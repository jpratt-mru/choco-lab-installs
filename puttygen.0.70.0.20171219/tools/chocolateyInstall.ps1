$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

Get-ChocolateyUnzip "$toolsDir\puttygen.7z" $toolsDir

Add-ShortcutToStartMenu "C:\ProgramData\chocolatey\bin\puttygen.exe" "PuTTYgen"


