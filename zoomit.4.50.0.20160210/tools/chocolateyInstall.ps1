$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

Get-ChocolateyUnzip "$toolsDir\ZoomIt.7z" $toolsDir

$regRoot = 'Software\Sysinternals\ZoomIt'

# Turn off license agreement nag
Add-RegistryEntryForEveryUser $regRoot 'EulaAccepted' 1 "Dword" 

# Change zoom hotkey to Ctrl + F1
Add-RegistryEntryForEveryUser $regRoot 'ToggleKey' 624 "Dword"

Add-ShortcutToStartMenu "C:\ProgramData\chocolatey\bin\ZoomIt.exe" "ZoomIt"

