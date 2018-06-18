$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

Get-ChocolateyUnzip "$toolsDir\ZoomIt.7z" $toolsDir

$regRoot = 'Software\Sysinternals\ZoomIt'
Add-RegistryEntryForEveryUser $regRoot 'EulaAccepted' 1 "Dword"
Add-RegistryEntryForEveryUser $regRoot 'ToggleKey' 624 "Dword"

Add-ShortcutToStartMenu "C:\ProgramData\chocolatey\bin\ZoomIt.exe" "ZoomIt"

