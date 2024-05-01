# FROM golang:1.22-bullseye as builder

# ENV AGENT_BUILD_DIR=/opt/guardrails-k8s-agent
# WORKDIR ${AGENT_BUILD_DIR}
# COPY ../kube_extension .

# # Run go mod tidy
# RUN \
#   go mod tidy && \
#   # Compile the Go application
#   go build -o ./build/kube_extension.ext && \
#   # Create an extensions.load file with the path to the kube_extension.ext
#   echo "/usr/lib/osquery/extensions/kube_extension.ext" > ./build/extensions.load

# Use Ubuntu 22.04 LTS (Jammy Jellyfish) as the base image
FROM ubuntu:22.04

ARG \
  OSQUERY_VERSION \
  KUBECTL_VERSION \
  TARGETARCH

RUN \
  # Install wget, curl, vim, and dependencies for osquery
  apt-get update && apt-get install -y wget curl vim libunwind8 libgcrypt20 liblzma5 libgpg-error0 && \
  # Clear the apt-get cache to reduce image size
  rm -rf /var/lib/apt/lists/* && \
  # Download the osquery package using the build argument
  wget https://pkg.osquery.io/deb/osquery_${OSQUERY_VERSION}-1.linux_${TARGETARCH}.deb -O /tmp/osquery.deb && \
  # Install the osquery package and remove the deb file
  dpkg -i /tmp/osquery.deb && rm /tmp/osquery.deb && \
  # Download the specific version of kubectl
  curl -LO "https://dl.k8s.io/release/v${KUBECTL_VERSION}/bin/linux/${TARGETARCH}/kubectl" && \
  # Install kubectl with appropriate permissions
  install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl && \
  # Remove the kubectl binary from the temporary location
  rm kubectl

# Copy the start script from the build context to the container
COPY ./start-script.sh /usr/local/bin/start-script.sh

# # Copy only the contents of the /opt/guardrails-k8s-agent/build/ directory from the builder stage
# COPY --from=builder /opt/guardrails-k8s-agent/build/* /usr/lib/osquery/extensions/

# Change the permissions of the start script to make it executable
RUN chmod u+x /usr/local/bin/start-script.sh

CMD ["/usr/local/bin/start-script.sh"]
