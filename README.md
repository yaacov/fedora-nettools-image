# fedora-nettools-image

A Fedora-based container image with debugging network tools. This project creates a container image that allows you to debug network issues in an OpenShift cluster because most pods in the cluster are based on minimal images that do not include tools for debugging network issues.

[quay.io/yaacov/fedora-nettools](https://quay.io/repository/yaacov/fedora-nettools?tab=tags&tag=latest)

## Building the Image

To build the container image, use the following command:
```sh
podman build -f Containerfile -t quay.io/yaacov/fedora-nettools .
```

## Pushing the Image
To push the container image to the registry, use the following command:

```sh
podman push quay.io/yaacov/fedora-nettools:latest
```

## Deploying the Pod
To deploy the pod in your OpenShift cluster, use the following net-tools.yaml configuration:

```bash
# Run the pod in current namespace
oc run fedora-nettools --image=quay.io/yaacov/fedora-nettools:latest --restart=Never

# "SSH" remotely into the pod, to execute network degugging, e.g. ping, ifconfig ...
oc exec -it fedora-nettools -n default -- /bin/bash
```

or use this yaml:

```yaml
kind: Pod
apiVersion: v1
metadata:
  name: fedora-nettools
  namespace: default
spec:
  containers:
    - name: fedora-nettools
      image: 'quay.io/yaacov/fedora-nettools:latest'
```

### Apply the configuration using the following command:

```sh
kubectl apply -f net-tools.yaml
```

## Usage
Once the pod is running, you can use the various network tools installed in the container to debug network issues. The tools included are:

  - iputils
  - curl
  - traceroute
  - net-tools
  - tcpdump
  - bind-utils

To access the pod and use the tools, execute the following command:

```sh
kubectl exec -it fedora-nettools -- /bin/bash
```

When using Openshift you can use `oc` command:

```sh
oc exec -it -n default fedora-nettools -- /bin/bash
```
