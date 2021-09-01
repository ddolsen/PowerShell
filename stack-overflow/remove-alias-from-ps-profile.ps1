# Updates $profile to remove an alias ('curl' in this example) each time PowerShell starts
# $profile is an automatic variable that stores the paths to the PowerShell profiles available in the current session
# https://stackoverflow.com/questions/68106651/cant-remove-powershell-alias-via-ps1-script/68106953#68106953

if (!(Test-Path -Path $profile)) {
    New-Item -Path $profile -Force
}
Add-Content -Path $profile -Value "Remove-Item alias:curl"
. $profile
