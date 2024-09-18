# [Grafana](https://grafana.com/oss/grafana/)

Using Helm to install

```sh
helm repo add grafana \
  https://grafana.github.io/helm-charts \
  --force-update

helm upgrade --install \
  --namespace monitoring --create-namespace \
  grafana grafana/grafana
```

Or you can use this repository with PowerShell `./Grafana/install.ps1` or Bash `./Grafana/install.sh`
