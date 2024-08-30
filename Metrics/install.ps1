#!/usr/bin/env pwsh

helm repo add `
    metrics-server https://kubernetes-sigs.github.io/metrics-server/ `
    --force-update

helm upgrade --install `
    -n kube-system `
    metrics-server metrics-server/metrics-server

helm upgrade metrics-server metrics-server/metrics-server `
    --set args="{--kubelet-insecure-tls}" `
    -n kube-system