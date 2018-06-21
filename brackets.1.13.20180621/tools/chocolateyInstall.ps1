$ErrorActionPreference = 'Stop';

$toolsPath = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'msi'
  file           = "$toolsPath\Brackets.Release.1.13.msi"
  softwareName   = 'brackets*'
  silentArgs     = "/qn /norestart /l*v `"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyInstallPackage @packageArgs

Get-ChildItem $toolsPath\*.msi | ForEach-Object { Remove-Item $_ -ea 0; if (Test-Path $_) { Set-Content ".ignore" } }

Add-ResourceForEveryUser "$toolsPath\Brackets" "AppData\Roaming"

Copy-Item -Path "$toolsPath\main.js" -Destination "C:\Progra~2\Brackets\www\" -Force

Move-ShortcutFromAllUsersToUserProfiles 'Brackets'