. "$PSScriptRoot\global-maco-constants.ps1"
. "$PSScriptRoot\shared-helpers.ps1"

#
# Move a shortcut (or shortcut folder) from All Users Start Menu to the Default User's
# profile and then into every User's profile.
#
Function Move-ShortcutFromAllUsersToUserProfiles ($ShortcutName) {
  Move-Item -Path "$global:ALL_USERS_START_MENU_LOCATION\$ShortcutName" -Destination "$(defaultUserStartMenuLocation)\$ShortcutName"
  copyShortcutFromDefaultToEveryUser $ShortcutName
}


Function copyShortcutFromDefaultToEveryUser ($Shortcut) {
  $Source = "$(defaultUserStartMenuLocation)\$Shortcut"
  Foreach ($User in $(getUserNames)) {
    $Destination = "$(userStartMenuLocation $User)\$Shortcut"
    Copy-Item $Source -Destination $Destination -Force -Recurse
  }
} 