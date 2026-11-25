# deploy.ps1 : déploiement idempotent
$IMAGE = "ghcr.io/youssef-gnaoui/usine-huile-olive:latest"

Write-Host "1. Récupération de la dernière image..."
docker pull $IMAGE

Write-Host "2. Arrêt de l'ancien conteneur (s'il existe)..."
docker stop usine-app 2>$null
docker rm usine-app 2>$null

Write-Host "3. Démarrage du nouveau conteneur..."
docker run -d --name usine-app -p 3000:3000 --restart unless-stopped $IMAGE

Write-Host "4. Terminé. Vérification :"
docker ps --filter name=usine-app