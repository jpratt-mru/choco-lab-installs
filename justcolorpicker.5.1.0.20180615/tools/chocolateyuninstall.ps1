$ErrorActionPreference = 'Stop'; # stop on all errors

Remove-ShortcutFromStartMenu 'JustColorPicker'

$regRoot = 'Software\Microsoft\Windows\CurrentVersion\Explorer\DontShowMeThisDialogAgain'
$regEntry = "{46FF719E-48AA-4FCC-80F9-B376FBF72F6F}"
Remove-RegistryEntryForEveryUser $regRoot `"$regEntry`"