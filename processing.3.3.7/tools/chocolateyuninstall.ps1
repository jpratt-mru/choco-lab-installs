$ErrorActionPreference = 'Stop'; # stop on all errors

Remove-ShortcutFromStartMenu 'Processing'
Remove-ResourceForEveryUser 'AppData\Roaming\Processing'