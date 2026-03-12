#!/usr/bin/env bash

set -euo pipefail
source dev-container-features-test-lib

check_expected_packages() {
  local expected_packages="$1"
  IFS=' ' read -ra PACKAGES <<<"$expected_packages"
  for package in "${PACKAGES[@]}"; do
    if [ -n "$package" ]; then
      check "Check if package $package is installed" dpkg -s "$package"
    fi
  done
}

echo "=========================== BEGIN SCENARIO TEST ==========================="

check_expected_packages "$EXPECTED_PACKAGES"
reportResults

echo "=========================== END SCENARIO TEST ==========================="
