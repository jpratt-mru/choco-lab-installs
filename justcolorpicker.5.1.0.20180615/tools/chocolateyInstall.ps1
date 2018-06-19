$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

Get-ChocolateyUnzip "$toolsDir\jcpicker.7z" $toolsDir

$regRoot = 'Software\Microsoft\Windows\CurrentVersion\Explorer\DontShowMeThisDialogAgain'
$GUID = "{46FF719E-48AA-4FCC-80F9-B376FBF72F6F}"

# registry hack to stop the nag on exit...
# we do the weird `" `" thing because of the {} in the GUID
Add-RegistryEntryForEveryUser $regRoot `"$GUID`" 'NO' 'String'   

Add-ShortcutToStartMenu "C:\ProgramData\chocolatey\bin\jcpicker.exe" "JustColorPicker"

