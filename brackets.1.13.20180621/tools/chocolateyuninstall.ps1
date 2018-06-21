$ErrorActionPreference = 'Stop'; # stop on all errors

Remove-ShortcutFromStartMenu 'Brackets'
Remove-ResourceForEveryUser 'AppData\Roaming\Brackets'

$ToRun = @"
MsiExec.exe /X{9CB3A036-0B7E-49B7-A60B-291E245CA6B2} /qn
"@

Start-Process 'cmd' -ArgumentList "/c $ToRun" -Wait