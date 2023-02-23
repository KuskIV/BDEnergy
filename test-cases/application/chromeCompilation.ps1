$username = $env:USERNAME
$document = $enc:DOCUMENT
Write-Host $document
$chromePath = "C:\Users\${username}\chromium\src"
$currPath = Get-Location

if (!(Test-Path -Path $chromePath)) 
{
    New-Item -ItemType Directory -Path $path | Out-Null
    Write-Host "Path created: $path"
}
Set-Location $chromePath

if (!(Test-Path -Path $chromePath+"\out"))
{
    Remove-Item -Path $chromePath"\out" -Recurse -Force
    Write-Host "Old compilation removed"
}

Write-Host "Starting Chromeium Compilation"
gn gen out/Default
autoninja -C out\Default chrome
Set-Location $currPath
