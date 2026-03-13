#!/usr/bin/env bash
set -euo pipefail

echo "Installing APT packages..."

if [ -z "$PACKAGES" ]; then
    echo "No packages specified."
    exit 0
fi

echo "Installing packages: $PACKAGES"

# Ensure curl exists (for minimal images)
if ! command -v curl >/dev/null 2>&1; then
    apt-get update
    apt-get install -y curl
fi

apt-get update
# shellcheck disable=SC2086
apt-get install -y --no-install-recommends $PACKAGES

# Clean up
rm -rf /var/lib/apt/lists/*

echo "APT packages installed successfully."
