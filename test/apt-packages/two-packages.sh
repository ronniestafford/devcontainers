#!/usr/bin/env bash

set -euo pipefail
EXPECTED_PACKAGES=$(jq -r '.["two-packages"].features.apt-packages.packages' ./scenarios.json) bash -c "./common_scenario_test.sh"
