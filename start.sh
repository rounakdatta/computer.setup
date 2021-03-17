#!/bin/bash

setup_prerequisites() {
    # install pip on macOS
    if ! pip3 --version; then
        echo "installing pip3 through easy_install"
        sudo easy_install pip3
    fi

    # install pip on arch linux
    if ! pip3 --version; then
        echo "installing pip3 through pacman"
        sudo pacman -Syu python-pip
    fi

    if ! ansible --version; then
        if [ "$(uname)" != "Darwin" ]; then
            echo "installing ansible through pacman"
            sudo pacman -Syu ansible
        else
            echo "setting up brew and installing through brew"
            /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
            brew install ansible
        fi
    fi
}

get_artifacts() {
    setupdir="/tmp/computer.setup.$RANDOM"
    mkdir -p $setupdir
    git clone https://github.com/rounakdatta/computer.setup.git $setupdir

    cd $setupdir || exit 1
}

start_install() {
    ansible-galaxy role install --force -r requirements.yml
    ansible-galaxy collection install --force -r requirements.yml
    ansible-playbook --ask-become-pass -i ./hosts playbook.yml --verbose
}

dry_run() {
    ansible-galaxy role install --force -r requirements.yml
    ansible-galaxy collection install --force -r requirements.yml
    sed '/geerlingguy.mas/d' playbook.yml > playbook.check.yml
    ansible-playbook -i ./hosts playbook.check.yml --check
    rm -f playbook.check.yml
}

main() {
    setup_prerequisites
    if [[ $(basename `git rev-parse --show-toplevel`) != "computer.setup" ]]; then
        get_artifacts
    fi
    if [ -z "$1" ]; then
        echo "starting installation"
        start_install
    else
        echo "testing dry run"
        dry_run
    fi
}

main "$1"
