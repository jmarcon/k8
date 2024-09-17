# README

This document describe some firt-time steps in your new Kubernetes Cluster

Some additional documentation:

- [Kubernetes Flavors](_docs/KUBERNETES_FLAVORS.md#cloud)

## Essential Dependencies

- [Cert-Manager](_docs/essential/CERTMANAGER.md) - PowerShell `./Cert/install.ps1` or Bash `./Cert/install.sh`
- [Metrics-Server](_docs/essential/METRICS.md) - PowerShell `./Metrics/install.ps1` or Bash `./Metrics/install.sh`

## Must Have

- [OpenTelemetry](_docs/must_have/OTEL.md) - Collect data (traces, metrics, logs) from the environment
- [Grafana](_docs/must_have/GRAFANA.md) - Dashboards for monitoring and observability
