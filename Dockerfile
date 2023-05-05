FROM lscr.io/linuxserver/openssh-server:latest

RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
    install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
RUN mkdir /etc/cont-init.d/
RUN printf 'apiVersion: v1\n\
clusters:\n\
- cluster:\n\
    certificate-authority: /var/run/secrets/kubernetes.io/serviceaccount/ca.crt\n\
    server: https://kubernetes.default\n\
  name: localk8s\n\
contexts:\n\
- context:\n\
    cluster: localk8s\n\
    user: user\n\
  name: localk8s\n\
current-context: localk8s\n\
kind: Config\n\
preferences: {}\n\
users:\n\
- name: user\n\
  user:\n\
    tokenFile: /var/run/secrets/kubernetes.io/serviceaccount/token' >> /opt/kubeconfig
RUN printf 'mkdir /config/.kube \n\
cp /opt/kubeconfig /config/.kube/config' >> /etc/cont-init.d/100-kubeconfig

RUN mkdir /ssh
COPY ssh/*.pub /ssh/


