# Debian Workstation 

## Bootstrap: Items required to use this repo

| Item    | Description | Status |
|---------|-------------|--------|
| Ansible |             | ✓      |

## Level 0: Functional Environment

| Item           | Description                                                         | Status |
|----------------|---------------------------------------------------------------------|--------|
| Bash           | Bash set as default shell, convenience aliases defined in .bashrc   | ✓      |
| Git            | Define aliases, configure username / email                          | ✓      |
| openssh-server | Required to support ssh access from other machines                  | ✓      |
| Pass           | pass installed, GPG key installed and trust level set appropriately | ✓      |
| rsync          |                                                                     | ✓      |
| ssh keys       |                                                                     | x      |
| tmux           | tmux and tmux configuration installed                               | ✓      |

<!-- TODO: Add cron job for updating pass -->

## Level 1: Essential Tools

| Item      | Description                                                      | Status |
|-----------|------------------------------------------------------------------|--------|
| Ag        | Install key bindings                                             | x      |
| Borg      | Backup script created, cron job scheduled for user               | ✓      |
| Emacs     | Emacs installed, emacs.d repo cloned and configuration installed | ✓      |
| Joplin    | Joplin installed with sync configuration applied                 | ✓      |
| Pass+     | pass extensions installed                                        | ✓      |
| Syncthing |                                                                  | ✓      |
| Vim       | vim configured to be default (over vi)                           | x      |

## Level 2: Specialized Development Environment

| Item                          | Description                         | Status |
|-------------------------------|-------------------------------------|--------|
| Docker                        | docker and docker-compose installed | ✓      |
| Python                        | Python installed with venv support  | ✓      |
| Fuzzy Search for Command Line | fzf                                 | ✓      |
                                                                             
## Level 3: Window Manager, Advanced Keymapping

| Item                                                   | Description                        | Status |
|--------------------------------------------------------|------------------------------------|--------|
| Window Manager ([Sway](https://swaywm.org/))           |                                    | ✓      |
| Keys remapped ([keyd](https://github.com/rvaiya/keyd)) |                                    | ✓      |
| Screenshot Tool(s)                                     | grim -g "$(slurp -d)" - \| wl-copy | x      |
| Gammastep (for adjusting screen brightness)            |                                    | ✓      |

## Level 4: Comms

| Item                                  | Description | Status      |
|---------------------------------------|-------------|-------------|
| IRC ([Weechat](https://weechat.org/)) |             | ✓           |
| Signal                                |             | need_to_fix |
| Tutanota Desktop App                  |             | next        |

## Level 5: Productivity Tools

| Item                       | Description                            | Status |
|----------------------------|----------------------------------------|--------|
| Task Warrior Client        |                                        | next   |
| watson                     | Install watson, source bash completion | x      |
| tmux modeline              | Update modeline to show watson status  | x      |
| emacs modeline             | Update modeline to show watson status  | x      |
| taskwarrior mode for Emacs |                                        | x      |
| starship mode line         |                                        | ✓      |
| nerd font                  |                                        | ✓      |

## Level 6: Specialized / Personal Tools

| Item          | Description                                            | Status |
|---------------|--------------------------------------------------------|--------|
| Audacity      |                                                        | x      |
| Chomp         | Create venv, build chomp, install chomp, create .chomp | x      |
| Dragon Player | Simple video player                                    | ✓      |
| Emacs+        | Install private Emacs configuration                    | x      |
| Gimp          |                                                        | ✓      |
| Krita         |                                                        | ✓      |
| Latex         |                                                        | ✓      |
| hledger       |                                                        | ✓      |
| Mud           |                                                        | next   |
| Plover        |                                                        | x      |
| qwertify      | Converts Dvorak phrase to Qwerty                       | ✓      |
| slurp         | For grabbing dimensions of screen selection            | ✓      |
| screenkey     | For screencasting / pair-programming                   | ✓      |
| Texinfo       |                                                        | ✓      |
| wf-recorder   | For creating screen recordings (use with slurp)        | ✓      |
| Zoom          |                                                        | ✓      |

## Level 7: info pages for manual steps

| Item                     | Description | Status |
|--------------------------|-------------|--------|
| IRC Setup Instructions   |             | next   |
| Joplin Sync Instructions |             | next   |

## Optional Configuration 1: Non-free Software

| Item                          | Description | Status |
|-------------------------------|-------------|--------|
| Enable non-free repos         |             | ✓      |
| Install Emacs documentation   |             | ✓      |

## Optional Configuration 2: Printer Server

| Item                              | Description | Status |
|-----------------------------------|-------------|--------|
| Install, configure printer server |             | ✓      |

## Optional Configuration 3: Printer Client

| Item                     | Description | Status |
|--------------------------|-------------|--------|
| Configure printer client |             | ✓      |

## Optional Configuration 4: Ultra-Wide Monitor Tweaks

| Item                    | Description | Status |
|-------------------------|-------------|--------|
| Update Sway background  |             | ✓      |
| Increase Foot font size |             | x      |

## Optional Configuration 5: Add Crash Debug Tools

TODO: Review article, determine if this is the right approach:
https://www.cyberciti.biz/faq/how-to-on-enable-kernel-crash-dump-on-debian-linux/

Or maybe use systemd-coredump instead?
https://groups.google.com/g/linux.debian.bugs.dist/c/ln1Mw4gFmUM?pli=1

| Item | Description | Status |
|------|-------------|--------|
| TBD  |             | x      |

## Optional Configuration 6: hledger-web server

| Item               | Description                                                                                | Status |
|--------------------|--------------------------------------------------------------------------------------------|--------|
| hledger-web        | Install hledger-web and firewallcmd, open port 5000, cronjob for keeping ledger up-to-date | x      |

## Optional Configuration 7: OpenVPN client

| Item    | Description                                | Status |
|---------|--------------------------------------------|--------|
| OpenVPN | Installed and configured to connect to VPN | x      |

## Dealing with issues that affected my system out of the box (or shortly after I started working with the system)

### Debian Live USB Installer has Raspberry Pi cruft left over

(need to find good link for the fix I used)

### Upgrading to newer kernel results in /boot running out of space

How to free up space:
https://tuxtweaks.com/2009/12/remove-old-kernels-in-ubuntu/ (2023-08-12)
