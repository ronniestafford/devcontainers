#!/usr/bin/env bash

set -euo pipefail
EXPECTED_VERSION=$(jq -r '.["pinned-version"].features.opencode.opencodeversion' ./scenarios.json) bash -c "./common_scenario_test.sh"
