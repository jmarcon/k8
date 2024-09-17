# OTEL Operator

The [OpenTelemetry Operator](https://github.com/open-telemetry/opentelemetry-operator) manages Open Telemetry Collectors and Auto Instrumentation in kubernetes.

```sh
helm repo add open-telemetry \
  https://open-telemetry.github.io/opentelemetry-helm-charts \
  --force-update

helm upgrade --install \
  -n otel --create-namespace \
  --set "manager.collectorImage.repository=otel/opentelemetry-collector-contrib" \
  otel-operator open-telemetry/opentelemetry-operator
```

Or you can use this repository with PowerShell `./OpenTelemetry/Operator/install.ps1` or Bash `./OpenTelemetry/Operator/install.sh`

We are using the `otel/opentelemetry-collector-contrib` image, but you can use other implementations of the collector, aka `otel/opentelemetry-collector` or `otel/opentelemetry-collector-k8s`.

>**⚠️ ErrPullImage**
>
> You may have some issues with the image pull, depending on your distribution. The possible causes are:
>
> - The image is not available in the repository
> - The repository is not accessible from your network
>
> If you're using KinD through the Docker Desktop configuration, you will probably need to pull the docker images and than load into your cluster.
>
>```sh
> docker pull "your/image:tag"
> kind load docker-image "your/image:tag"
>```
>
> Considering the helm used in this document, some images that will be used are:
>
> - quay.io/brancz/kube-rbac-proxy:v0.15.0
> - ghcr.io/open-telemetry/opentelemetry-operator/opentelemetry-operator
> - otel/opentelemetry-collector-contrib
>
> Podman desktop have an "Registry Extension" that adds default registries for `quay, dockerhub, github, and Google Container Registry`
>
> ---
