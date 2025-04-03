# Initialiseer git repository
git init

# Voeg alle bestanden toe
git add .

# Commit de bestanden
git commit -m "Initial commit"

# Voeg de GitHub repository toe
git remote add origin https://github.com/JSchreu/Fuera-del-Camino.git

# Push naar main branch
git push -u origin main

# Verplaats alle bestanden naar de root
git mv Fuera\ del\ Camino/* .
git mv Fuera\ del\ Camino/.* . 2>/dev/null

# Commit de verplaatste bestanden
git commit -m "Move files to root for GitHub Pages"

# Push de wijzigingen
git push origin main 