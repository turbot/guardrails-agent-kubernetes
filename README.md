# Guardrails Kubernetes Agent Image

![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)
[![Docker Image - Build and Release](https://github.com/turbot/guardrails-agent-kubernetes/actions/workflows/release.yaml/badge.svg)](https://github.com/turbot/guardrails-agent-kubernetes/actions/workflows/release.yaml)

Contains released version of the Guardrails Kubernetes Agent.

## Building

To build the image locally run the Docker build command:

```sh
docker build ./kubernetes/docker/ \
    -t guardrails-agent-kubernetes:latest \
    --build-arg OSQUERY_VERSION=5.12.1 \
    --build-arg KUBECTL_VERSION=1.30.0 \
    --build-arg AGENT_VERSION=0.0.2
```

## License

This repository is published under the [Apache 2.0](https://www.apache.org/licenses/LICENSE-2.0) (source code) and [CC BY-NC-ND](https://creativecommons.org/licenses/by-nc-nd/2.0/) (docs) licenses. Please see our [code of conduct](https://github.com/turbot/.github/blob/main/CODE_OF_CONDUCT.md). We look forward to collaborating with you!
