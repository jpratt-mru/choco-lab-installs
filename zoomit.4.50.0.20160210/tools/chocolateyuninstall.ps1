$ErrorActionPreference = 'Stop'; # stop on all errors

$regRoot = 'Software\Sysinternals'
$regEntry = "ZoomIt"
Remove-RegistryEntryForEveryUser $regRoot `"$regEntry`"

Remove-ShortcutFromStartMenu 'ZoomIt'
