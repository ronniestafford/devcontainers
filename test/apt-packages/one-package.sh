#!/usr/bin/env bash

set -euo pipefail
EXPECTED_PACKAGES=$(jq -r '.["one-package"].features.apt-packages.packages' ./scenarios.json) bash -c "./common_scenario_test.sh"
