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
helm repo add jetstack https://charts.jetstack.io --force-update

helm install \
  cert-manager jetstack/cert-manager \
  --namespace cert-manager --create-namespace \
  --set crds.enabled=true
```

### Metrics-Server

Using Helm to install

```bash
helm repo add metrics-server https://kubernetes-sigs.github.io/metrics-server/

helm upgrade --install \
    -n kube-system \
    metrics-server metrics-server/metrics-server
```

In Docker-Destkop and some other local distributions, the TLS verification will crash

In these cases, you can "patch" the helm installation to avoid tls verification

```bash
helm upgrade metrics-server metrics-server/metrics-server \
    --set args="{--kubelet-insecure-tls}" \
    -n kube-system
```

