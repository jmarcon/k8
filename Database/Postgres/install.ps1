#!/usr/bin/env pwsh

helm upgrade --install `
    pg oci://registry-1.docker.io/bitnamicharts/postgresql `
    --namespace database --create-namespace `
    --atomic `
    --set auth.username=pguser `
    --set auth.password=pg313233 `
    --set auth.database=default
