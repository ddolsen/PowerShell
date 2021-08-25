# Extracts the contents of an archive (.zip file) to a temporary directory
# Recursively gets the directory names and number of items in each
# Displays the results in the console
# Deletes the temporary directory
# https://stackoverflow.com/questions/68663901/powershell-read-folder-name-and-count-file-in-a-zip-file/68671666#68671666

Add-Type -Assembly "System.IO.Compression.FileSystem"

$zipFile = "path-to-zip-file"
$outPath = "path-to-temp-dir"
$hash = @{}

[System.IO.Compression.ZipFile]::ExtractToDirectory($zipFile, $outPath)

Get-ChildItem -Path $outPath -Recurse -Directory | ForEach-Object {
    $hash.Add($_.FullName,((Get-ChildItem -Path $_.FullName | Measure-Object).Count))
}

Write-Output $hash

Remove-Item $outPath -Recurse
