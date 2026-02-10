# devcontainers

## This repo
This repo is based on [template-starter](https://github.com/devcontainers/template-starter) for building and publishing custom VSCode devcontainer features. Each custom [feature](https://containers.dev/implementors/features/) is described by the devcontainer [specification](https://containers.dev/implementors/features-distribution/).

See also devcontainer [org](https://github.com/devcontainers) and [CLI](https://github.com/devcontainers/cli).

## Using a custom devcontainer feature in your repo
Custom features available:
- [Opencode](https://opencode.ai/)

To add a devcontainer to your project with features from this project, include an equivalent `.devcontainer/devcontainer.json` in your project repo.


## Project Structure
```
devcontainers/
├── .devcontainer/                          # Used for testing features in local dev environment, not published
│   └── devcontainer.json                   # Add to your own repo in order to specify features in your own devcontainer.
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