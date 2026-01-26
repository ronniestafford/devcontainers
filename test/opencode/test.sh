#!/bin/bash

set -euo pipefail
source dev-container-features-test-lib

echo "=========================== BEGIN STANDARD TEST ==========================="

# Feature-specific tests
# The 'check' command comes from the dev-container-features-test-lib.
check "Check opencode location" which opencode
check "Check opencode version" opencode --version

# Report results
# If any of the checks above exited with a non-zero exit code, the test will fail.
reportResults

echo "=========================== END STANDARD TEST ==========================="