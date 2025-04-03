# Create directories if they don't exist
New-Item -ItemType Directory -Force -Path "fonts/fa-solid", "fonts/playfair", "images"

# Download Font Awesome files
$faFiles = @(
    "https://use.fontawesome.com/releases/v5.15.4/webfonts/fa-solid-900.woff2",
    "https://use.fontawesome.com/releases/v5.15.4/webfonts/fa-solid-900.woff",
    "https://use.fontawesome.com/releases/v5.15.4/webfonts/fa-solid-900.ttf",
    "https://use.fontawesome.com/releases/v5.15.4/webfonts/fa-solid-900.eot",
    "https://use.fontawesome.com/releases/v5.15.4/webfonts/fa-solid-900.svg"
)

# Download Playfair Display files
$playfairFiles = @(
    "https://fonts.gstatic.com/s/playfairdisplay/v30/nuFvD-vYSZviVYUb_rj3ij__anPXJzDwcbmjWBN2PKdFvXDXbtXK-F2qC0s.woff2",
    "https://fonts.gstatic.com/s/playfairdisplay/v30/nuFvD-vYSZviVYUb_rj3ij__anPXJzDwcbmjWBN2PKdFvXDXbtXK-F2qC0s.woff",
    "https://fonts.gstatic.com/s/playfairdisplay/v30/nuFvD-vYSZviVYUb_rj3ij__anPXJzDwcbmjWBN2PKdFvXDXbtXK-F2qC0s.ttf",
    "https://fonts.gstatic.com/s/playfairdisplay/v30/nuFvD-vYSZviVYUb_rj3ij__anPXJzDwcbmjWBN2PKdFvXDXbtXK-F2qC0s.ttf",
    "https://fonts.gstatic.com/s/playfairdisplay/v30/nuFvD-vYSZviVYUb_rj3ij__anPXJzDwcbmjWBN2PKdFvXDXbtXK-F2qC0s.ttf",
    "https://fonts.gstatic.com/s/playfairdisplay/v30/nuFvD-vYSZviVYUb_rj3ij__anPXJzDwcbmjWBN2PKdFvXDXbtXK-F2qC0s.ttf",
    "https://fonts.gstatic.com/s/playfairdisplay/v30/nuFvD-vYSZviVYUb_rj3ij__anPXJzDwcbmjWBN2PKdFvXDXbtXK-F2qC0s.ttf",
    "https://fonts.gstatic.com/s/playfairdisplay/v30/nuFvD-vYSZviVYUb_rj3ij__anPXJzDwcbmjWBN2PKdFvXDXbtXK-F2qC0s.ttf",
    "https://fonts.gstatic.com/s/playfairdisplay/v30/nuFvD-vYSZviVYUb_rj3ij__anPXJzDwcbmjWBN2PKdFvXDXbtXK-F2qC0s.ttf",
    "https://fonts.gstatic.com/s/playfairdisplay/v30/nuFvD-vYSZviVYUb_rj3ij__anPXJzDwcbmjWBN2PKdFvXDXbtXK-F2qC0s.ttf",
    "https://fonts.gstatic.com/s/playfairdisplay/v30/nuFvD-vYSZviVYUb_rj3ij__anPXJzDwcbmjWBN2PKdFvXDXbtXK-F2qC0s.ttf",
    "https://fonts.gstatic.com/s/playfairdisplay/v30/nuFvD-vYSZviVYUb_rj3ij__anPXJzDwcbmjWBN2PKdFvXDXbtXK-F2qC0s.ttf"
)

# Download background image
$backgroundImage = "https://images.unsplash.com/photo-1510812431401-41d2bd2722f3?ixlib=rb-1.2.1&auto=format&fit=crop&w=1950&q=80"

# Download Font Awesome files
foreach ($file in $faFiles) {
    $fileName = $file.Split('/')[-1]
    Write-Host "Downloading Font Awesome file: $fileName"
    Invoke-WebRequest -Uri $file -OutFile "fonts/fa-solid/$fileName"
}

# Download Playfair Display files
foreach ($file in $playfairFiles) {
    $fileName = "PlayfairDisplay-Regular." + $file.Split('.')[-1]
    Write-Host "Downloading Playfair Display file: $fileName"
    Invoke-WebRequest -Uri $file -OutFile "fonts/playfair/$fileName"
}

# Download background image
Write-Host "Downloading background image"
Invoke-WebRequest -Uri $backgroundImage -OutFile "images/background.jpg"

Write-Host "Download complete!" 