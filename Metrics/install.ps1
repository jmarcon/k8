#!/usr/bin/env pwsh

$repo_name = "metrics-server"
$repo_url = "https://kubernetes-sigs.github.io/metrics-server"
$chart_ns = "metrics-server"
$chart_name = "metrics-server"
$instance_name = "metrics-server"

helm repo add $repo_name `
  $repo_url `
  --force-update

helm upgrade --install `
  -n $chart_ns --create-namespace `
  $instance_name $repo_name/$chart_name `
  --set args="{--kubelet-insecure-tls}"
