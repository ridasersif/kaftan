New-Item -ItemType Directory -Force -Path "images"

$urls = @{
    "hero.jpg" = "https://images.unsplash.com/photo-1539008835657-9e8e9680c956?auto=format&fit=crop&w=1920&q=80";
    "cat1.jpg" = "https://images.unsplash.com/photo-1583391733958-65e2716198f1?auto=format&fit=crop&w=800&q=80";
    "cat2.jpg" = "https://images.unsplash.com/photo-1550614000-4b95d4662247?auto=format&fit=crop&w=800&q=80";
    "cat3.jpg" = "https://images.unsplash.com/photo-1515372039744-b8f02a3ae446?auto=format&fit=crop&w=800&q=80";
    "image1.jpg" = "https://images.unsplash.com/photo-1595777457583-95e059d581b8?auto=format&fit=crop&w=800&q=80";
    "image2.jpg" = "https://images.unsplash.com/photo-1572804013309-82a891488000?auto=format&fit=crop&w=800&q=80";
    "image3.jpg" = "https://images.unsplash.com/photo-1584273143981-41c073dfe8f8?auto=format&fit=crop&w=800&q=80";
    "image4.jpg" = "https://images.unsplash.com/photo-1612336307429-8a898d10e223?auto=format&fit=crop&w=800&q=80";
    "image5.jpg" = "https://images.unsplash.com/photo-1515372039744-b8f02a3ae446?auto=format&fit=crop&w=800&q=80";
    "image6.jpg" = "https://images.unsplash.com/photo-1583391733958-65e2716198f1?auto=format&fit=crop&w=800&q=80";
    "image7.jpg" = "https://images.unsplash.com/photo-1566150905458-1bf1fc113f0d?auto=format&fit=crop&w=800&q=80";
    "image8.jpg" = "https://images.unsplash.com/photo-1550614000-4b95d4662247?auto=format&fit=crop&w=800&q=80";
    "image9.jpg" = "https://images.unsplash.com/photo-1560457079-9a6532ccb118?auto=format&fit=crop&w=800&q=80";
    "image10.jpg" = "https://images.unsplash.com/photo-1507679713670-bf2ddcb76b36?auto=format&fit=crop&w=800&q=80";
    "image11.jpg" = "https://images.unsplash.com/photo-1627334707018-0a0c4f1c9fc6?auto=format&fit=crop&w=800&q=80";
    "image12.jpg" = "https://images.unsplash.com/photo-1605280263929-1c4293f9c6c4?auto=format&fit=crop&w=800&q=80";
}

foreach ($key in $urls.Keys) {
    Invoke-WebRequest -Uri $urls[$key] -OutFile "images\$key"
}
