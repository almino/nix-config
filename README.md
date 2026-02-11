# Configuração do NixOS

1. Adicione o canal
   ```sh
   sudo nix-channel --add https://channels.nixos.org/nixos-24.11 nixos
   sudo nix-channel --add https://github.com/nix-community/home-manager/archive/release-25.11.tar.gz home-manager
   sudo nix-channel --add https://github.com/NixOS/nixos-hardware/archive/master.tar.gz nixos-hardware
   sudo nix-channel --update
   ```

## Dicas git

- Remover submódulo
  `git config -f .gitmodules --remove-section submodule.remove`
- Baixa todos os submódulos
  `git submodule update --init --recursive`
- Atualiza todos os submódulos
  `git pull --recurse-submodules`
