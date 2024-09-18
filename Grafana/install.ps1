#!/usr/bin/env pwsh

$repo_name = "grafana"
$repo_url = "https://grafana.github.io/helm-charts"
$chart_ns = "monitoring"
$chart_name = "grafana"
$instance_name = "grafana"
$script_root = $PSScriptRoot

helm repo add `
  $repo_name $repo_url `
  --force-update

helm upgrade --install `
  --namespace $chart_ns --create-namespace `
  $instance_name $repo_name/$chart_name `
  --values $script_root/values.yaml
