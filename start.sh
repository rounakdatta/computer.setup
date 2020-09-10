#!/bin/bash

setup_prerequisites() {
    if pip3 --version; then
        echo "installing pip3"
        sudo easy_install pip3
    fi

    echo "installing ansible through pip3"
    pip3 install ansible
}

start_install() {
    setupdir="/tmp/computer.setup.$RANDOM"
    mkdir -p $setupdir
    git clone https://github.com/rounakdatta/computer.setup.git $setupdir

    cd $setupdir || exit 1
    ansible-galaxy install -r requirements.yml
    ansible-playbook -i ./hosts playbook.yml --verbose
}

main() {
    setup_prerequisites
    start_install
}