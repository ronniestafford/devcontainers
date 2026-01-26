#!/usr/bin/env bash

set -euo pipefail
source dev-container-features-test-lib

echo "=========================== BEGIN SCENARIO TEST ==========================="

check "Check expected version in scenario: ${EXPECTED_VERSION}" 
check "Check opencode location" which opencode

# 3. Verify version output
EXPECTED_VERSION=${EXPECTED_VERSION:-latest}
INSTALLED_VERSION="$(opencode --version)"

echo "EXPECTED_VERSION:" ${EXPECTED_VERSION}
echo "INSTALLED_VERSION:" ${INSTALLED_VERSION}

if [ "${EXPECTED_VERSION}" = "latest" ]; then
    check "Check opencode INSTALLED_VERSION (latest) is semver" bash -c '
        echo "$1" | grep -qE "^[0-9]+\.[0-9]+\.[0-9]+$"
    ' _ "${INSTALLED_VERSION}"
else
    check "Check opencode INSTALLED_VERSION is EXPECTED_VERSION" bash -c '
        echo "$1" | grep -q "$2"
    ' _ "${INSTALLED_VERSION}" "${EXPECTED_VERSION}"
fi

reportResults

echo "=========================== END SCENARIO TEST ==========================="
