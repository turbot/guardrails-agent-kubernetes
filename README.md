# Guardrails Agent for Kubernetes

![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)
[![Docker Image - Build and Release](https://github.com/turbot/guardrails-agent-kubernetes/actions/workflows/release.yaml/badge.svg)](https://github.com/turbot/guardrails-agent-kubernetes/actions/workflows/release.yaml)

This Guardrails agent is used to send Kubernetes cluster details to a [Turbot Guardrails](https://turbot.com/guardrails) workspace using osquery with the [guardrails-agent-kubernetes](https://github.com/turbot/helm-charts/tree/main/charts/guardrails-agent-kubernetes) Helm chart.

Please see [Guardrails Kubernetes Integration](https://turbot.com/guardrails/docs/integrations/kubernetes) for more information.

## Building

To build the image locally run the Docker build command:

```sh
docker build ./kubernetes/docker/ \
    -t guardrails-agent-kubernetes:latest \
    --build-arg OSQUERY_VERSION=5.12.1 \
    --build-arg KUBECTL_VERSION=1.30.0 \
    --build-arg AGENT_VERSION=0.0.2
```

## Open Source & Contributing

This repository is published under the [Apache 2.0](https://www.apache.org/licenses/LICENSE-2.0) (source code) and [CC BY-NC-ND](https://creativecommons.org/licenses/by-nc-nd/2.0/) (docs) licenses. Please see our [code of conduct](https://github.com/turbot/.github/blob/main/CODE_OF_CONDUCT.md). We look forward to collaborating with you!

## Get Involved

**[Join #guardrails on Slack →](https://turbot.com/community/join)**

Want to help but don't know where to start? Pick up one of the `help wanted` issues:
* [Guardrails Agent for Kubernetes](https://github.com/turbot/guardrails-agent-kubernetes/issues?q=is%3Aopen+is%3Aissue+label%3A%22help+wanted%22)
