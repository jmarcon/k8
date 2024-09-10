# README

This document describe some firt-time steps in your new Kubernetes Cluster

## Kubernetes Flavors

### Cloud

#### [EKS : Amazon Elastic Kubernetes Service](https://docs.aws.amazon.com/pt_br/eks/latest/userguide/what-is-eks.html)

#### [AKS : Azure Kubernetes Service](https://learn.microsoft.com/pt-br/azure/aks/what-is-aks)

#### [GKE : Google Kubernetes Engine](https://cloud.google.com/kubernetes-engine)

### Local

#### [Docker Desktop](https://www.docker.com/resources/kubernetes-and-docker/)

#### [Podman Desktop](https://podman.io/features)

Podman doesn't have a built-in distribution for Kubernetes, but have a great integration with the kubernetes API.

#### [KinD : Kubernetes in Docker](https://kind.sigs.k8s.io/)

**K**in**D** is a tool for running local Kubernetes clusters using Docker container “nodes”.
kind was primarily designed for testing Kubernetes itself, but may be used for local development or CI.

#### [Minikube](https://minikube.sigs.k8s.io/docs/)

Minikube is local Kubernetes, focusing on making it easy to learn and develop for Kubernetes.

## Verify Good Dependencies

- Cert-Manager
- Metrics-Server

### Cert-Manager

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

### Metrics-Server

Using Helm to install

```sh
helm repo add metrics-server \
  https://kubernetes-sigs.github.io/metrics-server/ \
  --force-update

helm upgrade --install \
  -n kube-system \
  metrics-server metrics-server/metrics-server
```

In Docker-Destkop and some other local distributions, the TLS verification will crash

In these cases, you can "patch" the helm installation to avoid tls verification

```sh
helm upgrade --install \
  -n kube-system \
  --set args="{--kubelet-insecure-tls}" \
  metrics-server metrics-server/metrics-server
```

Or you can use this repository with PowerShell `./Metrics/install.ps1` or Bash `./Metrics/install.sh`

## Must Have

### Telemetry (OTEL)

#### OTEL Operator

The [OpenTelemetry Operator](https://github.com/open-telemetry/opentelemetry-operator) manages Open Telemetry Collectors and Auto Instrumentation in kubernetes.

```sh
helm repo add open-telemetry \
  https://open-telemetry.github.io/opentelemetry-helm-charts \
  --force-update

helm upgrade --install \
  -n otel --create-namespace \
  --set "manager.collectorImage.repository=docker.io/otel/opentelemetry-collector-contrib" \
  otel-operator open-telemetry/opentelemetry-operator
```

Or you can use this repository with PowerShell `./OpenTelemetry/Operator/install.ps1` or Bash `./OpenTelemetry/Operator/install.sh`

> Kind

If you're using KinD, you will probably need to pull the docker images and than load into your cluster.

```
docker pull "your/image:tag"
kind load docker-image "your/image:tag"
```

Considering the helm used in this document, some images that will be used are:

- quay.io/brancz/kube-rbac-proxy:v0.15.0
- ghcr.io/open-telemetry/opentelemetry-operator/opentelemetry-operator
- docker.io/otel/opentelemetry-collector-contrib






