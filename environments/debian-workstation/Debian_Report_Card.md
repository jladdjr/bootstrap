# Debian Workstation 

## Bootstrap: Items required to use this repo

| Item    | Description | Status |
|---------|-------------|--------|
| Ansible |             | ✓      |

## Level 0: Functional Environment

| Item     | Description                                                         | Status |
|----------|---------------------------------------------------------------------|--------|
| Bash     | Bash set as default shell, convenience aliases defined in .bashrc   | ✓      |
| Git      | Define aliases, configure username / email                          | ✓      |
| Pass     | pass installed, GPG key installed and trust level set appropriately | ✓      |
| ssh keys |                                                                     | #next  |
| tmux     | tmux and tmux configuration installed                               | x      |

## Level 1: Essential Tools

| Item   | Description                                                      | Status |
|--------|------------------------------------------------------------------|--------|
| Borg   | Backup script created, cron job scheduled for user               | ✓      |
| Emacs  | Emacs installed, emacs.d repo cloned and configuration installed | ✓      |
| Joplin | Joplin installed with sync configuration applied                 | x      |
| Pass+  | pass extensions installed, pass sync cron job defined            | #next  |
| Vim    | vim configured to be default (over vi)                           | x      |

## Level 2: Specialized Development Environment

| Item                          | Description                         | Status |
|-------------------------------|-------------------------------------|--------|
| Docker                        | docker and docker-compose installed | ✓      |
| Python                        | Python installed with venv support  | ✓      |
| Fuzzy Search for Command Line | fzf                                 | ✓      |
                                                                             
## Level 3: Window Manager, Advanced Keymapping

| Item                                                   | Description | Status |
|--------------------------------------------------------|-------------|--------|
| Window Manager ([Sway](https://swaywm.org/))           |             | ✓      |
| Keys remapped ([keyd](https://github.com/rvaiya/keyd)) |             | ✓      |
| Screenshot Tool(s)                                     |             | x      |

## Level 4: Comms

| Item                                  | Description | Status |
|---------------------------------------|-------------|--------|
| IRC ([Weechat](https://weechat.org/)) |             | x      |
| Signal                                |             | x      |
| Tutanota Desktop App                  |             | x      |

## Level 5: Productivity Tools

| Item                | Description | Status |
|---------------------|-------------|--------|
| Task Warrior Client |             | x      |

## Level 6: Specialized / Personal Tools

| Item    | Description                         | Status |
|---------|-------------------------------------|--------|
| Emacs+  | Install private Emacs configuration | x      |
| Latex   |                                     | x      |
| Ledger  |                                     | x      |
| Mud     |                                     | #next  |
| Plover  |                                     | x      |
| Texinfo |                                     | ✓      |
| Zoom    |                                     | ✓      |

## Level 7: info pages for manual steps

| Item                     | Description | Status |
|--------------------------|-------------|--------|
| IRC Setup Instructions   |             | x      |
| Joplin Sync Instructions |             | x      |
