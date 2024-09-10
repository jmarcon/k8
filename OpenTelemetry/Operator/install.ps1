#!/usr/bin/env pwsh

helm repo add open-telemetry `
  https://open-telemetry.github.io/opentelemetry-helm-charts `
  --force-update

helm upgrade --install `
  -n otel --create-namespace `
  --set "manager.collectorImage.repository=docker.io/otel/opentelemetry-collector-contrib" `
  otel-operator open-telemetry/opentelemetry-operator
