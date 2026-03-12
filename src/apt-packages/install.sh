#!/usr/bin/env bash
set -euo pipefail

echo "Installing APT packages..."

if [ -z "$PACKAGES" ]; then
    echo "No packages specified."
    exit 0
fi

echo "Installing packages: $PACKAGES"
apt-get update

# shellcheck disable=SC2086
apt-get install -y --no-install-recommends $PACKAGES

# Clean up
rm -rf /var/lib/apt/lists/*

echo "APT packages installed successfully."
