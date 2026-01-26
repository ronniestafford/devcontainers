# devcontainers

[Dev container Features](https://containers.dev/implementors/features/) for use with VSCode devcontainers, following the [dev container Feature distribution specification](https://containers.dev/implementors/features-distribution/). The CLI we use is found [here](https://github.com/devcontainers/cli).

## Project Structure

```
devcontainers/
├── .devcontainer/                          # Used for testing features in local dev environment, not published
│   └── devcontainer.json               
├── .github                             
│   └── workflows                       
│       ├── publish.yml                     # Publish to container registry
│       ├── test.yaml                       # Test 
│       └── validate.yaml                   # Validate for PRs
├── src                                     # Each folder in here is a separate feature, published
│   ├── opencode
│   │   ├── devcontainer-feature.json
│   │   └── install.sh                      # Entry point of container.
|   ├── ...
│   │   ├── devcontainer-feature.json
│   │   └── install.sh
├── test                                    # Each folder in here tests a separate feature
│   ├── opencode
│   │   ├── common_scenario_test.json       # Common scenario test script
│   │   └── latest-not-specified-version.sh # Scenario: check a 'latest' version is installed when no option specified
│   │   ├── latest-specified-version.json   # Scenario: check a 'latest' version is installed when 'latest' is specified
│   │   └── pinned-version.sh               # Scenario: check a specific version is installed
│   │   ├── scenarios.json                  # Scenarios spec: Set up multiple scenarios, each testing different feature option value
│   │   └── test.sh                         # Entry point for regular tests (required even if running scenario tests)
|   ├── ...
│   │   ├── scenarios.json
│   │   └── test.sh
...
```

## Run tests locally

Make sure all shell test scripts are executable `chmod +x "${SHELL_SCRIPT}"`.

```bash
$ npm i
$ npm run test:features
```