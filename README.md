### computer.setup
Minimalist Ansible playbook to set up your new system with speed 🚀.

#### Start
It's as easy as triggering a bash script:
```bash
curl -s https://raw.githubusercontent.com/rounakdatta/computer.setup/master/start.sh | /bin/bash
```

#### Support & Info
This playbook sets up and uses homebrew for the application installations. Tested to be working on macOS and Linux.

Capability & support is as:
- [x] homebrew CLI applications
- [x] homebrew cask applications
- [x] homebrew applications with custom taps
- [x] external DMGs
- [ ] external PKGs (implemented but [buggy](https://github.com/rounakdatta/computer.setup/issues/1))
- [x] App Store applications (through [mas](https://github.com/geerlingguy/ansible-role-mas))
- [x] Symlinking custom dotfiles from a repository