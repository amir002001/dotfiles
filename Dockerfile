FROM ubuntu:latest

RUN apt-get update && apt-get install sudo git ansible -y

RUN useradd -m -s /bin/bash amir && \
    echo "amir ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER amir

WORKDIR /home/amir

COPY setup-dotfiles.yaml .

RUN ansible-playbook setup-dotfiles.yaml




