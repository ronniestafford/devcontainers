#!/usr/bin/env bash
set -euo pipefail

# Ensure bash and curl exists (for minimal images)
if ! command -v curl >/dev/null 2>&1 || ! command -v bash >/dev/null 2>&1; then
    apt-get update
    apt-get install -y curl bash
fi

echo "Requested VERSION: ${VERSION}"
VERSION="${VERSION:-latest}"
echo "Installing OpenCode version '${VERSION}'"

if [ "${VERSION}" = "latest" ]; then
    su - "$_REMOTE_USER" -c "env -u VERSION curl -fsSL https://opencode.ai/install | bash"
else
    su - "$_REMOTE_USER" -c "curl -fsSL https://opencode.ai/install | bash -s -- --version \"${VERSION}\""
fi

echo "OpenCode installed successfully."
