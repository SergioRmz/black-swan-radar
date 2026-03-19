#!/usr/bin/env bash

set -euo pipefail

disable_repo_if_matches() {
  local file_path="$1"
  local match_text="$2"

  if [ -f "${file_path}" ] && grep -q "${match_text}" "${file_path}"; then
    echo "[setup] Deshabilitando repositorio conflictivo en ${file_path}"
    mv "${file_path}" "${file_path}.disabled"
  fi
}

sanitize_apt_sources() {
  disable_repo_if_matches "/etc/apt/sources.list" "dl.yarnpkg.com/debian"

  if [ -d "/etc/apt/sources.list.d" ]; then
    for list_file in /etc/apt/sources.list.d/*.list /etc/apt/sources.list.d/*.sources; do
      [ -e "${list_file}" ] || continue
      disable_repo_if_matches "${list_file}" "dl.yarnpkg.com/debian"
    done
  fi
}

install_with_apt() {
  local package_name="$1"

  if ! command -v apt-get >/dev/null 2>&1; then
    echo "[setup] Error: apt-get no esta disponible para instalar ${package_name}" >&2
    exit 1
  fi

  export DEBIAN_FRONTEND=noninteractive
  sanitize_apt_sources
  apt-get update
  apt-get install -y --no-install-recommends "${package_name}"
}

ensure_command() {
  local command_name="$1"
  local package_name="$2"

  if ! command -v "${command_name}" >/dev/null 2>&1; then
    echo "[setup] ${command_name} no encontrado. Instalando ${package_name}..."
    install_with_apt "${package_name}"
  fi
}

ensure_command "mvn" "maven"
ensure_command "curl" "curl"

echo "[setup] Verificando Maven"
mvn -v

echo "[setup] Descargando dependencias Maven"
mvn -DskipTests dependency:go-offline

echo "[setup] Instalando OpenCode CLI"
curl -fsSL https://opencode.ai/install | bash

echo "[setup] Entorno listo"
