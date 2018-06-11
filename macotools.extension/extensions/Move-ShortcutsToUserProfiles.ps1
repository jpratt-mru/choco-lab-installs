. "$PSScriptRoot\global-maco-constants.ps1"

#
# Get a list of names of all user names with profile directories (except Public) on
# a given machine.
#
Function getUserNames {
  $UserProfilesRoot = (Get-ItemProperty $global:PROFILE_LIST_LOCATION).ProfilesDirectory

  Get-ChildItem $UserProfilesRoot | % { $_.Name } | where { $_ -ne 'Public' }
}

Function defaultUserStartMenuLocation {
  userStartMenuLocation "Default"
}


#
# Location on Windows for a $User's Start Menu\Programs
#
Function userStartMenuLocation($User) {
  "C:\Users\$User\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\"
}


$DEFAULT_USER_START_MENU_LOCATION = $(defaultUserStartMenuLocation)
$ALL_USERS_START_MENU_LOCATION = "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\"

#
# Move a shortcut (or shortcut folder) from All Users Start Menu to the Default User's
# profile and then into every User's profile.
#
Function Move-ShortcutsToUserProfiles ($ShortcutName) {
  Move -Path "$ALL_USERS_START_MENU_LOCATION\$ShortcutName" -Destination "$DEFAULT_USER_START_MENU_LOCATION\$ShortcutName"
  copyShortcutFromDefaultToEveryUser $ShortcutName
}


Function copyShortcutFromDefaultToEveryUser ($Shortcut) {
  $Source = "$DEFAULT_USER_START_MENU_LOCATION\$Shortcut"
  Foreach ($User in $(getUserNames)) {
    $Destination = "$(userStartMenuLocation $User)\$Shortcut"
    Copy-Item $Source -Destination $Destination -Force -Recurse
  }
}