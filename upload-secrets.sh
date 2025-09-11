#!/bin/bash

VAULT_CONTAINER="vault-server"
VAULT_PATH="secret"
LOCAL_FOLDER="/c/documentos/D/CURSOS/Lenguajes/Java/Repositorio/Azure/service-configuration"
CONTAINER_FOLDER="/vault/secrets"

# Crear carpeta en el contenedor
docker exec -it $VAULT_CONTAINER mkdir -p $CONTAINER_FOLDER

# Copiar solo los JSON
for file in $LOCAL_FOLDER/*.json; do
    docker cp "$file" "$VAULT_CONTAINER:$CONTAINER_FOLDER"
done

# Recorrer los JSON y subirlos
for file in $LOCAL_FOLDER/*.json; do
    filename=$(basename -- "$file")
    key="${filename%.*}"               # sin extensión
    key="${key%-*}/${key##*-}"         # cambia solo el último "-" por "/"
    echo "📦 Subiendo $filename a Vault en $VAULT_PATH/$key..."

    docker exec -i $VAULT_CONTAINER sh -c "vault kv put $VAULT_PATH/$key @$CONTAINER_FOLDER/$filename"
done