# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ lib, pkgs, ... }:

{
  boot.kernelModules = [ "nvidia-uvm" ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    (blender.override { cudaSupport = true; })
    cudaPackages.cudatoolkit
    cudaPackages.cudnn
    gimp
    inkscape
    nvidia-container-toolkit
    # Games ======================================
    (heroic.override {
      extraPkgs = pkgs: [
        gamemode
        gamescope
      ];
    })
    lutris
    netcat
    nmap
    prismlauncher
    protonplus
    wineWowPackages.stable
    winetricks
    zgrab2
  ]; # ++ [ pkgs.unstable.mcpelauncher-ui-qt ];

  # hardware.bluetooth.settings = {
  #   General = {
  #     Enable = "Source,Sink,Media,Socket";
  #   };
  # };

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
  hardware.nvidia-container-toolkit.enable = true;

  hardware.xone.enable = true;

  hardware.pulseaudio = {
    enable = false;
    package = pkgs.pulseaudioFull;
  };

  hardware.xpadneo.enable = true;

  home-manager.users = {
    almino = import
      ./almino/hm/me.gamer-laptop.nix;
    # edileuza = import ./hm/lenovo-laptop.hm.nix;
  };

  imports = [
    ./almino
    # ./almino/apps/android-studio.nix
    ./almino/apps/docker.nix
    ./almino/apps/virt-manager.nix
    ./gnome.nix # includes default.nix
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

  nixpkgs.config.permittedInsecurePackages = [
    "electron-33.4.11" # heroic
  ];

  programs.gamemode.enable = true;
  programs.nix-required-mounts.presets.nvidia-gpu.enable = true;

  programs.obs-studio = {
    enable = true;
    enableVirtualCamera = true;
    plugins = with pkgs.obs-studio-plugins; [
      advanced-scene-switcher
      droidcam-obs
      obs-backgroundremoval
      obs-composite-blur
      obs-mute-filter
      # obs-nvfbc # 25.05 broken
      obs-pipewire-audio-capture
      obs-source-switcher
      obs-text-pthread
      obs-tuna
      wlrobs
    ];
  };

  programs.steam.enable = true;

  security.pam.loginLimits = [{
    domain = "almino";
    type = "hard";
    item = "nofile";
    value = "524288";
  }];

  services.blueman.enable = true;

  services.fstrim.enable = true;

  services.pipewire.enable = lib.mkForce true;

  services.xserver.videoDrivers = [ "nvidia" ];

  systemd.extraConfig = "DefaultLimitNOFILE=524288";

  users.groups.servarr = {
    gid = 689;
    members = [ "almino" ];
  };
}
