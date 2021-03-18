### computer.setup
Minimalist Ansible playbook to set up your new system with speed 🚀.

#### Start
To set up git SSH access and password store, as a first step, we need to place the keys as:
- SSH private key is to be kept at `~/.ssh/keys/personal.pem`
- GPG private key is to be kept at `~/.secrets/private.key`
- GPG public key is to be kept at `~/.secrets/public.key`

If you're transporting these keys from an existing system, [this gist](https://gist.github.com/rounakdatta/e8555f6feab148a2337b05dce50a71e8) might be useful.

Then it's as easy as issuing a shell command:
```bash
curl -s https://raw.githubusercontent.com/rounakdatta/computer.setup/master/start.sh | /bin/bash
```

#### Support & Info
This playbook is idempotent. Tested to be working on macOS and Arch Linux.

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
