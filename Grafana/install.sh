#!/usr/bin/env bash

readonly repo_name='grafana'
readonly repo_url='https://grafana.github.io/helm-charts'
readonly chart_ns='monitoring'
readonly chart_name='grafana'
readonly instance_name='grafana'

helm repo add \
  $repo_name $repo_url \
  --force-update

helm upgrade --install \
  --namespace $chart_ns --create-namespace \
  $instance_name $repo_name/$chart_name \
  --values values.yaml
