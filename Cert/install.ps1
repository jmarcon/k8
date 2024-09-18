#!/usr/bin/env pwsh

$repo_name = "jetstack"
$repo_url = "https://charts.jetstack.io"
$chart_ns = "cert-manager"
$chart_name = "cert-manager"
$instance_name = "cert-manager"
$script_root = $PSScriptRoot

helm repo add `
  $repo_name $repo_url `
  --force-update

helm upgrade --install `
  --namespace $chart_ns --create-namespace `
  $instance_name $repo_name/$chart_name `
  --values $script_root/values.yaml
