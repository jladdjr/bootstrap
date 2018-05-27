## Provisioning vm

To deploy fresh environment:

```bash
$ vagrant up
```

To re-run playbook:

```bash
$ vagrant provision
```

If this repo has been checked out inside the vm, can use `make` to re-run specific tags:

```bash
$ make mail
```

## Requirements:

### `auth` role

* Uploads public key from https://github.com/jladdjr.keys
* Uploads private key from `/Users/jladd/.ssh/id_rsa` (on ansible controller)

### `mutt` role

Use the following steps to provide the `mutt` role with e-mail passwords:

1. Create a file called `mutt_secrets.yml` (in the same directory as provision.yml)
1. In the file, create two extravars containing personal / work e-mail passwords:
    ```yaml
    MUTT_PERSONAL_PASSWORD: MY_PASSWORD
    MUTT_REDHAT_PASSWORD: MY_PASSWORD
    ```
1. Use `ansible-vault encrypt mutt_secrets.yml` to encrypt the file
1. Source the extravars file and ansible-vault password when calling `ansible-playbook`. For example:
  `ansible-playbook -e @mutt_secrets.yml --ask-vault-pass --tags mutt provision.yml`

If these extravars are not defined, the `mutt` role will still run, but will use dummy passwords in `.offlineimaprc` and `.msmtprc`.

For more information, see:
http://docs.ansible.com/ansible/latest/user_guide/vault.html
