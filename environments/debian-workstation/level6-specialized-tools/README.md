# Level 6: Specialized Tools

Prerequisites:
- Level 5 (probably less, though?)

- Must add jeeves in /etc/hosts (currently 192.168.1.203)
- Must have ssh creds to ssh into jeeves

Current status:
Runs cleanly without errors.

Required follow-up tweaks:
texinfo is a really big package; can we install anything smaller?

Not yet supported:
- chomp
  - current manual steps:
    - Install dependencies (yq)
    - Install chomp
      ```bash
      cd
      mkdir venvs
      python3 -m venv venvs/chomp
      ~/venvs/chomp/bin/pip3 install chompchomp
      echo 'export PATH="/home/jim/venvs/chomp/bin:$PATH"' >> ~/.bashrc
      ```
    - Also have to add support for shell completion in bash:

      ```bash
      # WIP
      # https://opensource.com/article/18/3/creating-bash-completion-script

      function _chomp () {
              cur="${COMP_WORDS[COMP_CWORD]}"
              #prev="${COMP_WORDS[COMP_CWORD-1]}"

              foods=$(yq '[.[].name] | @csv' ~/.chomp/food_library.yml | tr ',' ' ' | tr '"' ' ' | tr '\\' ' ')
              COMPREPLY=($(compgen -W '$foods' -- $cur))
      }

      complete -F _chomp chomp
      ```

    - Finally, have to make sure that syncthing is syncing the ~/.chomp dir from monolith,
      which should, in turn, sync the same dir from revolution.

## History

*2024-10-26*
Ran playbook on think / Debian 12
