#!/usr/bin/env bash

readonly repo_name='kedacore'
readonly repo_url='https://kedacore.github.io/charts'
readonly chart_ns='keda'
readonly chart_name='keda'
readonly instance_name='keda'
readonly script_root=$(dirname "$(readlink -f "${BASH_SOURE}")")

helm repo add \
  $repo_name $repo_url \
  --force-update

helm upgrade --install \
  --namespace $chart_ns --create-namespace \
  $instance_name $repo_name/$chart_name \
  --values $script_root/values.yaml