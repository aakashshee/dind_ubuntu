FROM ubuntu
USER root
RUN apt -y update

RUN apt-get update && \
    apt-get install -qy curl apt-transport-https ca-certificates software-properties-common && \
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg |  apt-key add - && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" && \
    apt-get update && \
    apt install -qy docker-ce

RUN apt install -y openjdk-8-jdk
RUN apt-get install -y openssh-server
RUN mkdir -p /var/run/sshd
RUN ssh-keygen -A
ADD sshd_config /etc/ssh/sshd_config
RUN echo root:password123 | chpasswd

COPY start.sh .
RUN chmod +x start.sh

ENTRYPOINT ["sh", "start.sh","run"]


