# https://stackoverflow.com/questions/68922453/new-to-programming-it-should-refresh-the-site-but-it-wont-thanks/68923344#68923344

$proc = [System.Diagnostics.Process]::Start("chrome.exe", "https://www.stackoverflow.com") | Get-Process
$wshell = New-Object -ComObject WScript.Shell

while ($true) {
    Start-Sleep -Seconds 10
    $wshell.AppActivate($proc.Id)
    $wshell.SendKeys("{F5}")
}
