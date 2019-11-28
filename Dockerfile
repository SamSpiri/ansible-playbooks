FROM ubuntu:19.04

RUN apt-get -y update
RUN apt-get -y install \
  sudo \
  curl \
  nano \
  mc \
  unzip \
  pigz \
  ca-certificates \
  openssh-client \
  software-properties-common \
  apt-transport-https \
  python-pip \
  jq \
  cowsay \
  locales \
  python-jmespath \
  python-requests \
  python-pip \
  net-tools \
  iputils-ping \
  lsb-release \
  gnupg \
  && echo "alias mc='mc -b'" > /etc/profile.d/00-aliases.sh \
  && sed -i '/%sudo/d' /etc/sudoers \
  && echo "%sudo   ALL=(ALL:ALL)  NOPASSWD: ALL" >> /etc/sudoers
RUN curl -sL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/microsoft.asc.gpg > /dev/null \
  && curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add - \
  && echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/azure-cli.list \
  && echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list \
  && apt-add-repository -y ppa:ansible/ansible \
  && apt-get -y install azure-cli kubectl ansible \
  && pip install --upgrade cryptography \
  && pip install --upgrade azure \
  && pip install --upgrade azure-cli \
  && python -m easy_install --upgrade pyOpenSSL \
  && curl https://raw.githubusercontent.com/helm/helm/master/scripts/get | bash

COPY entrypoint.sh /
WORKDIR /mnt
ENTRYPOINT ["/entrypoint.sh"]
