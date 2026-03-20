#!/usr/bin/env bash

set -euo pipefail

echo "[setup] Verificando herramientas"
mvn -v
docker --version
curl --version

echo "[setup] Descargando dependencias Maven"
mvn -DskipTests dependency:go-offline

echo "[setup] Instalando OpenCode CLI"
curl -fsSL https://opencode.ai/install | bash

echo "[setup] Entorno listo"
