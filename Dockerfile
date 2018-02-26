FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
curl
CMD /bin/bash

RUN version=$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt) && \
  curl -L https://storage.googleapis.com/kubernetes-release/release/$version/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl && \
  chmod +x /usr/local/bin/kubectl

RUN curl https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get | bash
