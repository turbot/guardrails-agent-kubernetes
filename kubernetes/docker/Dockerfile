# Use Ubuntu 24.04 LTS (Noble Numbat) as the base image
FROM ubuntu:24.04

ARG \
  OSQUERY_VERSION \
  KUBECTL_VERSION \
  AGENT_VERSION \
  TARGETARCH

# Copy the start script from the build context to the container
COPY ./start-script.sh /usr/local/bin/start-script.sh

RUN \
  # Install wget, curl, vim, and dependencies for osquery
  apt-get update && apt-get install -y wget curl vim libunwind8 libgcrypt20 liblzma5 libgpg-error0 adduser && \
  # Clear the apt-get cache to reduce image size
  rm -rf /var/lib/apt/lists/* && \
  # Download the osquery package using the build argument
  wget https://pkg.osquery.io/deb/osquery_${OSQUERY_VERSION}-1.linux_${TARGETARCH}.deb -O /tmp/osquery.deb && \
  # Install the osquery package
  dpkg -i /tmp/osquery.deb && \
  # Download the specific version of kubectl
  curl -LO "https://dl.k8s.io/release/v${KUBECTL_VERSION}/bin/linux/${TARGETARCH}/kubectl" && \
  # Install kubectl with appropriate permissions
  install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl && \
  # Remove the kubectl binary from the temporary location
  rm kubectl && \
  # Create the directory for the osquery extensions
  mkdir -p /usr/lib/osquery/extensions/ && \
  # Download the osquery extension tarball from the GitHub release
  wget -O /tmp/osquery_extension_kubernetes.linux_${TARGETARCH}.tar.gz https://github.com/turbot/steampipe-plugin-kubernetes/releases/download/v${AGENT_VERSION}/steampipe_osquery_kubernetes.linux_${TARGETARCH}.tar.gz && \
  # Extract the osquery extension tarball
  tar -xzf /tmp/osquery_extension_kubernetes.linux_${TARGETARCH}.tar.gz -C /tmp && \
  # Move the extension to the extensions directory
  cp /tmp/steampipe_osquery_kubernetes.ext /usr/lib/osquery/extensions/ && \
  # Create an extensions.load file with the path to the kubernetes.ext
  echo "/usr/lib/osquery/extensions/steampipe_osquery_kubernetes.ext" > ./usr/lib/osquery/extensions/extensions.load && \
  # Remove the tarball and the extracted extension
  rm -rf /tmp/* && \
  # Change the permissions of the start script to make it executable
  chmod u+x /usr/local/bin/start-script.sh && \
  # Create a non-root user `agent` with the UID 2000
  adduser --system --no-create-home --disabled-password --ingroup root --uid 2000 guardrails-agent

CMD ["/usr/local/bin/start-script.sh"]
