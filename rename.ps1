$i = 1
$videos = Get-ChildItem -Path "images" -Filter "video*.mp4" | Sort-Object Name
foreach ($v in $videos) {
    # Skip if name is already exact video1.mp4 and it's the 1st iteration to avoid errors, but Force handles it.
    Rename-Item $v.FullName -NewName "video$i.mp4" -Force
    $i++
}
