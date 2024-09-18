#!/usr/bin/env pwsh

$repo_name = "open-telemetry"
$repo_url = "https://open-telemetry.github.io/opentelemetry-helm-charts"
$chart_ns = "otel"
$chart_name = "opentelemetry-operator"
$instance_name = "otel-operator"
$script_root = $PSScriptRoot

helm repo add `
  $repo_name $repo_url `
  --force-update

helm upgrade --install `
  --namespace $chart_ns --create-namespace `
  $instance_name $repo_name/$chart_name `
  --values $script_root/values.yaml
