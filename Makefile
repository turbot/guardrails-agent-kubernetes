.PHONY: act-run-release docker-build

# Developer helper commands
act-run-release:
	act -W .github/workflows/release.yaml -s GH_ACCESS_TOKEN="${GH_PACKAGING_TOKEN}" \
		--input agent_version="0.4.0" \
		--input osquery_version="5.12.1" \
		--input kubectl_version="1.30.0"

docker-build:
	docker build -t guardrails-agent-kubernetes:latest ./kubernetes/docker \
		--build-arg AGENT_VERSION="0.4.0" \
		--build-arg OSQUERY_VERSION="5.12.1" \
		--build-arg KUBECTL_VERSION="1.30.0"
