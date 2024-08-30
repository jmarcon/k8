#!/usr/bin/env bash

helm repo add \
    jetstack https://charts.jetstack.io \
    --force-update

helm upgrade --install \
    cert-manager jetstack/cert-manager \
    --namespace cert-manager --create-namespace \
    --set crds.enabled=true