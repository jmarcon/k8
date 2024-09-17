# Kubernetes Flavors

## Cloud

- [EKS : Amazon Elastic Kubernetes Service](https://docs.aws.amazon.com/pt_br/eks/latest/userguide/what-is-eks.html)
- [AKS : Azure Kubernetes Service](https://learn.microsoft.com/pt-br/azure/aks/what-is-aks)
- [GKE : Google Kubernetes Engine](https://cloud.google.com/kubernetes-engine)

## Local

### [Docker Desktop](https://www.docker.com/resources/kubernetes-and-docker/)

Docker Desktop uses an internal distribution or you can enable KinD integration directly inside de Docker Desktop settings.

To use KinD and the possibility to create multi-node clusters, you need to enable it in a very hidden settings panel. You need to press the sequence: 

`⬆️ ⬆️ ⬇️ ⬇️ ⬅️ ➡️ ⬅️ ➡️ 🅱️ 🅰️`

### [Podman Desktop](https://podman.io/features)

Podman doesn't have a built-in distribution for Kubernetes, but have a great integration with the kubernetes API and some extensions that can help manage the distributions KinD and Minikube.

### [KinD : Kubernetes in Docker](https://kind.sigs.k8s.io/)

**K**in**D** is a tool for running local Kubernetes clusters using Docker container “nodes”.
kind was primarily designed for testing Kubernetes itself, but may be used for local development or CI.

In this repository, we have a KinD cluster definition and can be applied with the command:

`kind create cluster --config .\KinD\kind.cluster.yaml`

The cluster will be created with 4 nodes (1 control-plane and 3 workers)

### [Minikube](https://minikube.sigs.k8s.io/docs/)

Minikube is local Kubernetes, focusing on making it easy to learn and develop for Kubernetes.

Minikube can also simulate the number of nodes and has a ton of addons that can improve your experience.

```sh
minikube start `
    --profile minikube `
    --nodes 3 `
    --container-runtime containerd `
    --cpus 12 `
    --memory 64g `

minikube addons enable metrics-server -p minikube
minikube addons enable ingress        -p minikube
minikube addons enable ingress-dns    -p minikube
minikube addons enable dashboard      -p minikube
```

- metrics-server: can also be installed via helm chart (documentend in [this document](essential/METRICS.md))
