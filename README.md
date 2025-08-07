# Help

## Comandos

```sh
# Verificação
curl -sSL https://github.com/lscosta90br/provisioning/raw/main/bootstrap.sh | bash

curl -sSL https://github.com/lscosta90br/provisioning/raw/main/bootstrap.sh | bash -s -- -v


# execucao
ansible-pull -U https://github.com/lscosta90br/provisioning.git -l local
```
ansible-pull -U "$REPO_URL" -C "$BRANCH" -i localhost, playbooks/bootstrap_ansible.yml