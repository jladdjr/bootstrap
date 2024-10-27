# Level 1: Essential Tools

Prerequisites:
Level 0

Current status:
- Runs cleanly without errors.
- See configuration issues below

Issues:
- Syncthing account hard-coded to use root
  - There is a syncthing Ansible task that references `syncthing_service_user`
    .. which is hard-coded to root in defaults/main.yml
  - Workaround:
    - sudo systemctl stop syncthing@root
      sudo systemctl disable syncthing@root
      sudo systemctl enable syncthing@jim
      sudo systemctl start syncthing@root

Follow-up configuration needed:
- syncthing
  - Set username / password
  - Configure shared folders

Deprecated:
- joplin role

Required follow-up tweaks:
- In emacs
  - Need to follow instructions in init.el to clone install org
  - Need to either delete jim.org or steph.org
  - Also need to comment out slime lines

Gotchas:
- Running Emacs (client) instead of Emacs (GUI) when still using the GNOME desktop

UX:
- It's confusing to see a pass role in both level0 and level1.
  Need to clarify that level1 builds on core pass installation by
  adding pass extensions.

## History

*2024-10-26*
Ran playbook on think / Debian 12
