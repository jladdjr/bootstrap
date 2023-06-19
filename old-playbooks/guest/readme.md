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
$ make awx
```

.. or call ansible-playbook directly:

`ansible-playbook -i inventory provision.yml`

## Requirements:

### `auth` role

* Uploads public key from https://github.com/jladdjr.keys
* Uploads private key from `/Users/jladd/.ssh/id_rsa` (on ansible controller)