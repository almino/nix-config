# Configuração do NixOS

1. Adicione o canal
   ```sh
   sudo nix-channel --add https://channels.nixos.org/nixos-23.11 nixos
   ```

## Dicas git

- Remover submódulo
  `git config -f .gitmodules --remove-section submodule.remove`
- Baixa todos os submódulos
  `git submodule update --init --recursive`
- Atualiza todos os submódulos
  `git pull --recurse-submodules`
