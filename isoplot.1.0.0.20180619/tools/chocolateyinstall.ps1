$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

Get-ChocolateyUnzip "$toolsDir\isoplot.7z" $toolsDir

Add-ShortcutToStartMenu "C:\ProgramData\chocolatey\lib\isoplot\tools\activate_isoplot.vbs" "Isoplot"

$command = @"
icacls "C:\ProgramData\chocolatey\lib\isoplot\tools" /grant Users:(OI)(CI)M
"@

Start-Process 'cmd' -ArgumentList "/c $command" -Wait