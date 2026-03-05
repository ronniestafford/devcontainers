# devcontainers

## This Repo
This repo is based on [template-starter](https://github.com/devcontainers/template-starter) for building and publishing custom VSCode devcontainer features. Each custom [feature](https://containers.dev/implementors/features/) is described by the devcontainer [specification](https://containers.dev/implementors/features-distribution/).

See also devcontainer [org](https://github.com/devcontainers) and [CLI](https://github.com/devcontainers/cli).

## Using a Custom devcontainer Feature in Your Project Repo
Custom features available:
- [Opencode](https://opencode.ai/). The opencode devcontainer will look for `opencode.json` config in your project root folder as described [here](https://opencode.ai/docs/config/). An example `opencode-config-example.json` config file is included that you can rename and edit.

An example `.devcontainer/devcontainer.json` is included in this repo. Add it to your project repo to use.

## Project Structure
```
devcontainers/
├── .devcontainer/                          # Used for testing features in local dev environment, not published
│   └── devcontainer.json                   # Add to your own repo in order to specify features in your own devcontainer
├── .github                             
│   └── workflows                       
│       ├── publish.yml                     # Publish to container registry
│       ├── test.yaml                       # Test 
│       └── validate.yaml                   # Validate for PRs
├── src                                     # Each folder in here is a separate feature, published
│   ├── opencode
│   │   ├── devcontainer-feature.json
│   │   └── install.sh                      # Entry point of container
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

## Local Feature Development
### Dependencies (Tests)

The following installs node via nvm as described [here](https://nodejs.org/en/download/package-manager).

```bash
$ curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash    # installs nvm (Node Version Manager) v0.40.1
$ nvm -v
```

Reopening the terminal, `nvm` will read `.nvmrc` file to check the required node version.

```bash
$ nvm install        # download and install Node.js specified in .nvmrc (restart the terminal first)
$ node -v            # verifies the right Node.js version is in the environment
$ npm -v             # verifies the right npm version is in the environment
```

### Run Tests
Make sure all shell test scripts are executable `chmod +x "${SHELL_SCRIPT}"`.

```bash
$ npm i
$ npm run test:features
```