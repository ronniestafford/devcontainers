#!/usr/bin/env bash
set -euo pipefail

echo "Installing OpenCode..."

echo "Requested OPENCODEVERSION: ${OPENCODEVERSION}"
OPENCODEVERSION="${OPENCODEVERSION:-latest}"
echo "Installing OpenCode version '${OPENCODEVERSION}'"
apt-get update

case "${OPENCODEVERSION}" in
latest)
    su - "$_REMOTE_USER" -c "env -u OPENCODEVERSION curl -fsSL https://opencode.ai/install | bash"
    ;;
*)
    su - "$_REMOTE_USER" -c "curl -fsSL https://opencode.ai/install | bash -s -- --version \"${OPENCODEVERSION}\""
    ;;
esac

echo "...OpenCode installed successfully."
