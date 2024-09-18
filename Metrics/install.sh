#!/usr/bin/env bash

readonly repo_name='metrics-server'
readonly repo_url='https://kubernetes-sigs.github.io/metrics-server'
readonly chart_ns='metrics-server'
readonly chart_name='metrics-server'
readonly instance_name='metrics-server'
readonly script_root=$(dirname "$(readlink -f "${BASH_SOURE}")")

helm repo add \
  $repo_name $repo_url \
  --force-update

helm upgrade --install \
  --namespace $chart_ns --create-namespace \
  $instance_name $repo_name/$chart_name \
  --values $script_root/values.yaml
