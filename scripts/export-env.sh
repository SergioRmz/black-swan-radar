#!/usr/bin/env bash

set -euo pipefail

ENV_FILE="${1:-.env}"

if [[ ! -f "${ENV_FILE}" ]]; then
  echo "[export-env] File not found: ${ENV_FILE}" >&2
  return 1 2>/dev/null || exit 1
fi

set -a
# shellcheck disable=SC1090
source <(
  grep -v '^[[:space:]]*#' "${ENV_FILE}" | grep -v '^[[:space:]]*$'
)
set +a

echo "[export-env] Environment variables loaded from ${ENV_FILE}"
