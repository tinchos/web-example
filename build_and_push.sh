#!/bin/bash

LANG="nginx"
echo "este script usara los datos"
echo "Usuario de GitHub: $GH_USERNAME"
echo "Token de GitHub: $GH_PAT"

sleep 2

# Pedir al usuario que ingrese TAG
read -p "Ingrese el valor para TAG: " TAG

echo "TAG especificado: $TAG"

sleep 2
# valida que el TAG no este vacío
if [ -z "$TAG" ]; then
    echo "El valor de TAG no puede estar vacío."
    exit 1
fi

# Autenticar en GitHub Packages usando las variables de entorno del usuario
echo $GH_PAT | docker login ghcr.io -u $GH_USERNAME --password-stdin

# Construir la imagen Docker
docker build --build-arg LANG="$LANG" --build-arg TAG="$TAG" -t ghcr.io/$GH_USERNAME/web-app:$TAG .

# Pujar la imagen a GitHub Packages
docker push ghcr.io/$GH_USERNAME/web-app:$TAG

