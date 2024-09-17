# [Cert-Manager](https://cert-manager.io/docs/installation/helm/)

Using Helm to Install

```bash
helm repo add jetstack \
  https://charts.jetstack.io \
  --force-update

helm install \
  cert-manager jetstack/cert-manager \
  --namespace cert-manager --create-namespace \
  --set crds.enabled=true
```

Using this repository with PowerShell `./Cert/install.ps1` or Bash `./Cert/install.sh`
