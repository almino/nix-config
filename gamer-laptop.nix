# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, ... }:

{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    (wrapOBS {
      plugins = with obs-studio-plugins; [
        droidcam-obs
        # obs-backgroundremoval
        obs-pipewire-audio-capture
        wlrobs
      ];
    })
    (heroic.override {
      extraPkgs = pkgs: [
        gamemode
      ];
    })
    lutris
    protonplus
    wineWowPackages.stable
    winetricks
  ] ++ [ pkgs.unstable.mcpelauncher-ui-qt ];

  # hardware.bluetooth.enable = true; # enables support for Bluetooth
  # hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  hardware.nvidia = {
    open = false;
    prime = {
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
      offload.enable = true;
    };
  };

  hardware.xone.enable = true;
  hardware.xpadneo.enable = true;

  home-manager.users = {
    almino = import
      ./almino/hm/me.gamer-laptop.nix;
    edileuza = import ./hm/lenovo-laptop.hm.nix;
  };

  imports = [
    ./almino
    ./almino/apps/android-studio.nix
    ./gnome.nix # includes default.nix
    ./private/apps/tailscale.nix
    ./qemu.nix
    ./touchpad.nix
    # ((import ./nix/sources.nix).package + "/pyproject.nix")
    <home-manager/nixos>
    # <nixos-hardware/common/cpu/intel/sandy-bridge>
  ];

  networking.hostName = "lenovo-15IRH8"; # Define your hostname.

  nix.settings = {
    substituters = [
      "https://cuda-maintainers.cachix.org"
    ];
    trusted-public-keys = [
      "cuda-maintainers.cachix.org-1:0dq3bujKpuEPMCX6U4WylrUDZ9JyUG0VpVZa7CNfq5E="
    ];
  };

  programs.gamemode.enable = true;
  programs.steam.enable = true;

  security.pam.loginLimits = [{
    domain = "almino";
    type = "hard";
    item = "nofile";
    value = "524288";
  }];

  services.blueman.enable = true;

  services.xserver.videoDrivers = [ "nvidia" ];

  systemd.extraConfig = "DefaultLimitNOFILE=524288";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users = {
    almino.packages = with pkgs; [
      blender
    ];
    edileuza = {
      description = "Edileuza";
      extraGroups = [ "networkmanager" ];
      initialPassword = "123456";
      isNormalUser = true;
    };
  };
}
