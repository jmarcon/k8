#!/usr/bin/env bash

readonly repo_name='jetstack'
readonly repo_url='https://charts.jetstack.io'
readonly chart_ns='cert-manager'
readonly chart_name='cert-manager'
readonly instance_name='cert-manager'
readonly script_root=$(dirname "$(readlink -f "${BASH_SOURE}")")

helm repo add \
    $repo_name $repo_url \
    --force-update

helm upgrade --install \
    --namespace $chart_ns --create-namespace \
    $instance_name $repo_name/$chart_name \
    --values $script_root/values.yaml