$proc = [System.Diagnostics.Process]::Start("chrome.exe", "https://www.stackoverflow.com") | Get-Process
$wshell = New-Object -ComObject WScript.Shell

while ($true) {
    Start-Sleep -Seconds 10
    $wshell.AppActivate($proc.Id)
    $wshell.SendKeys("{F5}")
}
