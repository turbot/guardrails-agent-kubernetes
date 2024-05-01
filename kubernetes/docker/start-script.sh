#!/bin/bash

set -e

CLUSTER_UID=$(kubectl get ns kube-system -o jsonpath='{.metadata.uid}')

osqueryd \
  --ephemeral \
  --verbose \
  --disable_database \
  --host_identifier=specified \
  --specified_identifier="k8s-uid:cluster:$CLUSTER_UID" \
  --tls_hostname=$TLS_HOSTNAME \
  --config_plugin=tls \
  --config_refresh=30 \
  --config_tls_endpoint=/api/latest/osquery/config \
  --enroll_tls_endpoint=/api/latest/osquery/enroll \
  --enroll_secret_env "ENROLL_SECRET" \
  --logger_tls_endpoint "/api/latest/osquery/logger" \
  --logger_plugin=tls \
  --logger_event_type=false \
  --extensions_autoload=/usr/lib/osquery/extensions/extensions.load
