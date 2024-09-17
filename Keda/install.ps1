#!/usr/bin/env pwsh

$repo_name = "kedacore"
$repo_url = "https://kedacore.github.io/charts"
$chart_ns = "keda"
$chart_name = "keda"
$instance_name = "keda"

helm repo add `
  $repo_name $repo_url `
  --force-update

helm upgrade --install `
  --namespace $chart_ns --create-namespace `
  $instance_name $repo_name/$chart_name