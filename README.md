# devcontainers

[Dev container Features](https://containers.dev/implementors/features/) for use with VSCode devcontainers, following the [dev container Feature distribution specification](https://containers.dev/implementors/features-distribution/). The CLI we use is found [here](https://github.com/devcontainers/cli).

## Project Structure

```
devcontainers/
├── .devcontainer/                      # Used for testing features in local env, not published
│   └── devcontainer.json               
├── .github                             
│   └── workflows                       
│       ├── publish.yml                 # Publish to container registry
│       ├── test.yaml                   # Test 
│       └── validate.yaml               # Validate for PRs
├── src                                 # Each folder in here is a separate feature, published
│   ├── opencode
│   │   ├── devcontainer-feature.json
│   │   └── install.sh                  # Entry point of container.
|   ├── ...
│   │   ├── devcontainer-feature.json
│   │   └── install.sh
├── test                                # Each folder in here tests a separate feature
│   ├── opencode
│   │   ├── scenarios.json              # Inject different option parameters for each test
│   │   └── test.sh                     # Entry point for test.
|   ├── ...
│   │   ├── scenarios.json
│   │   └── test.sh
...
```

## Run tests locally

Make sure shell scripts are executable 

```bash
$ npm i
$ npm run test:features
```