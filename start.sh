#!/bin/bash

setup_prerequisites() {
    if ! pip3 --version; then
        echo "installing pip3"
        sudo easy_install pip3
    fi

    if ! ansible --version; then
        echo "installing ansible through pip3"
        pip3 install ansible
    fi
}

get_artifacts() {
    setupdir="/tmp/computer.setup.$RANDOM"
    mkdir -p $setupdir
    git clone https://github.com/rounakdatta/computer.setup.git $setupdir

    cd $setupdir || exit 1
}

start_install() {
    ansible-galaxy install -r requirements.yml
    ansible-playbook -i ./hosts playbook.yml --verbose
}

main() {
    setup_prerequisites
    if [[ $(basename `git rev-parse --show-toplevel`) != "computer.setup" ]]; then
        get_artifacts
    fi
    start_install
}

main