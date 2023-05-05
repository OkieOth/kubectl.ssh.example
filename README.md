# TL;DR;
Create a cluster with a maintenance pod that contains kubectl and an sshd

# Requirements
* docker
* k3d
* local kubectl installed

# Usage

```bash
# create cluster with 3 agents
k3d cluster create k3d.eiko.01 --agents 3

# create a docker image
./buildDockerImage.sh

docker run --rm -it -e USER_NAME=kubeadmin -e PUBLIC_KEY_DIR=/ssh ghcr.io/okieoth/kubectl:0.1.0
```

# Documentation
* https://octopus.com/blog/ssh-into-kubernetes-cluster
* https://itnext.io/running-kubectl-commands-from-within-a-pod-b303e8176088
* https://hub.docker.com/r/linuxserver/openssh-server