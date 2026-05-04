$ErrorActionPreference = "Stop"
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$url = "https://www.kaftanelegance.com/fr"
$response = Invoke-WebRequest -Uri $url -UseBasicParsing

$html = $response.Content
$pattern = '<img[^>]+src="([^"]+\.(?:jpg|jpeg|png|webp)[^"]*)"'
$matches = [regex]::Matches($html, $pattern)

$imgUrls = @()
foreach ($m in $matches) {
    $src = $m.Groups[1].Value
    if ($src -notmatch "^http") {
        if ($src -match "^\/\/") {
            $src = "https:" + $src
        } elseif ($src -match "^\/") {
            $src = "https://www.kaftanelegance.com" + $src
        } else {
            $src = "https://www.kaftanelegance.com/" + $src
        }
    }
    # Clean up any query parameters or amps for safe download if needed, but usually it works.
    $src = $src -replace "&amp;", "&"
    if ($imgUrls -notcontains $src) {
        $imgUrls += $src
    }
}

Write-Output "Found $($imgUrls.Count) images."

$limit = 12
$count = 1
foreach ($imgUrl in $imgUrls) {
    if ($count -gt $limit) { break }
    try {
        $ext = "jpg"
        if ($imgUrl -match "\.png") { $ext = "png" }
        elseif ($imgUrl -match "\.webp") { $ext = "webp" }
        
        $dest = "images\image$count.$ext"
        Invoke-WebRequest -Uri $imgUrl -OutFile $dest
        Write-Output "Downloaded $imgUrl to $dest"
        $count++
    } catch {
        Write-Output "Failed to download $imgUrl"
    }
}
