{ pkgs, ... }:

{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # (import /home/almino/Code/pje-office { inherit pkgs; })
    git
    google-chrome
    home-manager
    nanorc
    service-wrapper
    telegram-desktop
    vlc
  ];

  imports = [ ./apps ];

  # Allow unfree packages
  # nixpkgs.config.allowUnfree = true;
  # https://nixos.wiki/wiki/Chromium#For_NixOS
  nixpkgs.config = {
    allowUnfree = true;
  };

  programs.git = {
    enable = true;
    config = {
      fetch.recurseSubmodules = "on-demand";
      init.defaultBranch = "main";
      push.recurseSubmodules = "on-demand";
      rebase.autoStash = true;
      submodule.recurse = true;
      url."https://github.com/".insteadOf = [
        "gh:"
        "github:"
      ];
    };
  };
}
