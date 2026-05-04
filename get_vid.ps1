$ErrorActionPreference = "SilentlyContinue"

Write-Output "Searching and downloading 6 short vertical caftan videos..."
.\yt-dlp.exe "ytsearch20:caftan marocain tiktok short" --match-filter "duration < 60" --max-downloads 6 -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/mp4" -o "images\video%(autonumber)d.mp4"

$vids = Get-ChildItem -Path "images" -Filter "video*.mp4"
Write-Output "Successfully downloaded $($vids.Count) videos."
