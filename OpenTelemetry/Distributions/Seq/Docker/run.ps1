#!/usr/bin/env pwsh

$repo_name   = "datalust"
$chart_name  = "seq"
$script_root = $PSScriptRoot

$PH = $(echo "313233" | docker run --rm -i $repo_name/$chart_name config hash)

docker run `
  --name seq `
  -d `
  --restart unless-stopped `
  -e ACCEPT_EULA=Y `
  -e SEQ_FIRSTRUN_ADMINUSERNAME="admin" `
  -e SEQ_FIRSTRUN_ADMINPASSWORDHAS=$PH `
  -v $script_root\Data:/data `
  -p 1982:80 `
  -p 5341:5341 `
  -p 45341:45341 `
  $repo_name/$chart_name

