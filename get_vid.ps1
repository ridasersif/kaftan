$ErrorActionPreference = "SilentlyContinue"
Write-Output "Downloading yt-dlp.exe..."
Invoke-WebRequest -Uri "https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp.exe" -OutFile "yt-dlp.exe"

Write-Output "Searching and downloading caftan video..."
.\yt-dlp.exe "ytsearch1:moroccan caftan runway fashion short" --match-filter "duration < 300" -f "best[ext=mp4]/mp4" -o "images\hero.mp4"

if (Test-Path "images\hero.mp4") {
    Write-Output "Successfully downloaded hero.mp4!"
} else {
    Write-Output "Failed to download video."
}
