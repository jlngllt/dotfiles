#!/bin/bash

install_docker() {
    apt update || true
    apt install -y docker.io

    sudo groupadd docker
    sudo gpasswd -a "$TARGET_USER" docker
}

me_sudo() {
    # add user to sudoers
    adduser "$TARGET_USER" sudo
}

install_base() {
    apt update || true
    apt -y upgrade 
    apt install -y \
        curl \
        parallel \
        jq \
        vim
    apt autoremove -y
    apt autoclean -y
    apt clean -y
}

me_sudo
install_base
install_docker
