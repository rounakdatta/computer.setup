### computer.setup
Minimalist Ansible playbook to set up your new system with speed 🚀.

#### Start
It's as easy as issuing a shell command:
```bash
curl -s https://raw.githubusercontent.com/rounakdatta/computer.setup/master/start.sh | /bin/bash
```

#### Support & Info
This playbook leverages existing modules wherever possible. Tested to be working on macOS (Linux support WIP).

Capability & support is as:
- [x] homebrew CLI applications
- [x] homebrew cask applications
- [x] homebrew applications with custom taps
- [x] external DMGs
- [x] external PKGs ~(implemented but [buggy](https://github.com/rounakdatta/computer.setup/issues/1))~
- [x] App Store applications (through [mas](https://github.com/geerlingguy/ansible-role-mas))
- [x] Symlinking custom dotfiles from a repository
- [x] pip-managed Python packages
- [x] Custom tasks to install from source
- [x] Generating private SSH configs
