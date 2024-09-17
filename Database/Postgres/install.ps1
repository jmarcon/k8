#!/usr/bin/env pwsh

$repo_url = "oci://registry-1.docker.io/bitnamicharts/"
$chart_ns = "database"
$chart_name = "postgresql"
$instance_name = "pg"
$usr = "pguser"
$pwd = "pg313233"
$db  = "default"

helm repo add `
  $repo_name $repo_url `
  --force-update

helm upgrade --install `
  $instance_name $repo_url/$chart_name `
  --namespace $chart_ns --create-namespace `
  --atomic `
  --set auth.username=$usr `
  --set auth.password=$pwd `
  --set auth.database=$db
