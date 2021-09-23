#  What is the smallest whole number that is equal to seven times the sum of its digits?

function convertNumToDigitsList {
    param (
        [int]$num
    )
    $digitsList = New-Object System.Collections.Generic.List[System.Object]
    for ($i = 0; $i -lt $num.ToString().Length; $i++) {
        $digitsList.Add([System.Convert]::ToInt32("$num"[$i], 10))
    }
    Write-Host "Digits list = $digitsList"
    return $digitsList
}

# Starting number
$num = 0

do {
    $num++
    Write-Host "Number = $num"
    $sum = 0
    foreach ($digit in (convertNumToDigitsList -num $num)) {
        $sum += $digit
    }
    Write-Host "Sum = $sum"
    Write-Host "Sum * 7 = $($sum * 7)`n"
} while ($num -ne (7 * $sum))

Write-Host "*******************************************"
Write-Host "** SOLUTION = $num"
Write-Host "*******************************************"