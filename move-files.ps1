# Maak een nieuwe directory voor de root bestanden
New-Item -ItemType Directory -Path "../root" -Force

# Kopieer alle bestanden naar de root directory
Copy-Item -Path "*" -Destination "../root/" -Recurse -Force

# Verwijder de oude bestanden
Remove-Item -Path "*" -Recurse -Force

# Verplaats de bestanden van root terug
Move-Item -Path "../root/*" -Destination "." -Force

# Verwijder de root directory
Remove-Item -Path "../root" -Force 