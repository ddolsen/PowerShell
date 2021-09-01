Invoke-WebRequest -Uri "https://nodejs.org/dist/v14.17.1/node-v14.17.1-x64.msi" -OutFile ".\node-v14.17.1-x64.msi"
Start-Process msiexec.exe -Wait -ArgumentList "/i node-v14.17.1-x64.msi /quiet"

npm install pm2@latest -g

Invoke-WebRequest -Uri "node-app-url" -OutFile ".\app.js"

$trigger = New-JobTrigger -AtLogOn -RandomDelay "00:00:30"
Register-ScheduledJob -Trigger $trigger -ScriptBlock { pm2 start app.js } -Name "RunNodeAppAtLogon"
