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

Use the following steps to provide the `mutt` role with e-mail passwords:

* Create a file called mutt_secrets.yml (in the same directory as provision.yml)
* In the file, create two extravars containing personal / work e-mail passwords:
```yaml
MUTT_PERSONAL_PASSWORD: MY_PASSWORD
MUTT_REDHAT_PASSWORD: MY_PASSWORD
```
* Use `ansible-vault encrypt mutt_secrets.yml` to encrypt the file
* Source the extravars file and ansible-vault password when calling `ansible-playbook`. For example:
  `ansible-playbook -e @path/to/vault_file --ask-vault-pass --tags mutt provision.yml`

If these extravars are not defined, the `mutt` role will still run, but will use dummy passwords in `.offlineimaprc` and `.msmtprc`.

For more information, see:
http://docs.ansible.com/ansible/latest/user_guide/vault.html
