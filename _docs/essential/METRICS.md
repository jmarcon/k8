# Metrics-Server

> **⚠️ Warning ⚠️**
>
> Metrics Server is meant only for autoscaling purposes. For example, don't use it to forward metrics to monitoring solutions, or as a source of monitoring solution metrics. In such cases please collect metrics from Kubelet /metrics/resource endpoint directly.

Using Helm to install

```sh
helm repo add metrics-server \
  https://kubernetes-sigs.github.io/metrics-server/ \
  --force-update

helm upgrade --install \
  --namespace kube-system --create-namespace \
  metrics-server metrics-server/metrics-server
```

In Docker-Destkop and some other local distributions, the TLS verification will crash.

In these cases, you can "patch" the helm installation to avoid tls verification.

```sh
helm upgrade --install \
  --namespace kube-system --create-namespace \
  --set args="{--kubelet-insecure-tls}" \
  metrics-server metrics-server/metrics-server
```

Or you can use this repository with PowerShell `./Metrics/install.ps1` or Bash `./Metrics/install.sh`
