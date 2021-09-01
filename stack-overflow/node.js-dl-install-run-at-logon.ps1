Use Invoke-WebRequest to download the Node.js Windows installer
# Use Start-Process and msiexec.exe to install it
# With Node.js installed, use npm to install the latest version of PM2
# Use Invoke-WebRequest again to download the Node app file
# Create a scheduled task that runs at logon with New-JobTrigger and Register-ScheduledJob
# https://stackoverflow.com/questions/68100669/how-to-make-a-windows-10-install-file/68106369#68106369

Invoke-WebRequest -Uri "https://nodejs.org/dist/v14.17.1/node-v14.17.1-x64.msi" -OutFile ".\node-v14.17.1-x64.msi"
Start-Process msiexec.exe -Wait -ArgumentList "/i node-v14.17.1-x64.msi /quiet"

npm install pm2@latest -g

Invoke-WebRequest -Uri "node-app-url" -OutFile ".\app.js"

$trigger = New-JobTrigger -AtLogOn -RandomDelay "00:00:30"
Register-ScheduledJob -Trigger $trigger -ScriptBlock { pm2 start app.js } -Name "RunNodeAppAtLogon"
