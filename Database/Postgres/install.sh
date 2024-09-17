#!/usr/bin/env bash

readonly repo_url='oci://registry-1.docker.io/bitnamicharts/'
readonly chart_ns='database'
readonly chart_name='postgresql'
readonly instance_name='pg'
readonly usr='pguser'
readonly pwd='pg313233'
readonly db ='default'

helm repo add \
  $repo_name $repo_url \
  --force-update

helm upgrade --install \
  $instance_name $repo_url/$chart_name \
  --namespace $chart_ns --create-namespace \
  --atomic \
  --set auth.username=$usr \
  --set auth.password=$pwd \
  --set auth.database=$db


