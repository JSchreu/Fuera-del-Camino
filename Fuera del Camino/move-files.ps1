# Maak de docs map als deze nog niet bestaat
New-Item -ItemType Directory -Force -Path "docs"

# Verplaats alle bestanden naar de docs map
Move-Item -Path "index.html" -Destination "docs/" -Force
Move-Item -Path "style.css" -Destination "docs/" -Force
Move-Item -Path "script.js" -Destination "docs/" -Force
Move-Item -Path "manifest.json" -Destination "docs/" -Force
Move-Item -Path "service-worker.js" -Destination "docs/" -Force
Move-Item -Path "fonts" -Destination "docs/" -Force
Move-Item -Path "icons" -Destination "docs/" -Force

# Maak een .nojekyll bestand aan om Jekyll te uitschakelen
New-Item -ItemType File -Force -Path "docs/.nojekyll"

Write-Host "Bestanden zijn verplaatst naar de docs map" 