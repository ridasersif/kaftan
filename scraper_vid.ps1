$ErrorActionPreference = "SilentlyContinue"
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$url = "https://www.kaftanelegance.com/fr"
$response = Invoke-WebRequest -Uri $url -UseBasicParsing
$html = $response.Content

$pattern = 'https?://[^"''<>\s]*?\.mp4[^"''<>\s]*'
$matches = [regex]::Matches($html, $pattern)

$vidUrls = @()
foreach ($m in $matches) {
    $vid = $m.Groups[0].Value
    if ($vidUrls -notcontains $vid) {
        $vidUrls += $vid
    }
}

Write-Output "Found $($vidUrls.Count) videos."
foreach ($vidUrl in $vidUrls) {
    Write-Output "URL: $vidUrl"
}

if ($vidUrls.Count -gt 0) {
    $dest = "images\hero.mp4"
    Invoke-WebRequest -Uri $vidUrls[0] -OutFile $dest
    Write-Output "Downloaded video to $dest"
} else {
    Write-Output "No videos found on the homepage."
}
