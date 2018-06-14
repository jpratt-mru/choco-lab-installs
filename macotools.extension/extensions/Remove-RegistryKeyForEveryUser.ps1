. "$PSScriptRoot\global-maco-constants.ps1"
. "$PSScriptRoot\shared-helpers.ps1"
Function Remove-RegistryKeyForEveryUser ($RegKey) {
  $ThingToDo = "removeRegistryKey $RegKey"
  # Users who are currently logged in
  DoToAllLoggedInUsers $ThingToDo

  # Users who are not logged in, but who do have a profile on the machine
  DoToAllUsersWithProfileNotLoggedIn $ThingToDo

  # for the Default User
  DoToDefaultUser $ThingToDo
}

Function RemoveRegistryKey ($RegKey, $SID) {
  $RegPath = "Registry::HKU\$SID\$RegKey"

  Remove-Item -Path $RegPath -Force -Recurse
}