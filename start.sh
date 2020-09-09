#!/bin/bash

setup_prerequisites() {
    pip3 --version
    if [ $? -ne 0 ]; then
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
    ansible-playbook -i ./hosts playbook.yml --verbose
}

main() {
    setup_prerequisites
    start_install
}