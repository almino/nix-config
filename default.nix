# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ lib, ... }:

{
  imports = [
    # Include the results of the hardware scan.
    /etc/nixos/hardware-configuration.nix
    ./este-pc
    ./apps.nix
    ./network.nix
    ./sound.nix
    ./typography.nix
    ./users.nix
  ];

  # Configure console keymap
  console.keyMap = "br-abnt2";

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Enable networking
  networking.networkmanager.enable = lib.mkDefault true;

  # Select internationalisation properties.
  i18n.defaultLocale = "pt_BR.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_BR.UTF-8";
    LC_IDENTIFICATION = "pt_BR.UTF-8";
    LC_MEASUREMENT = "pt_BR.UTF-8";
    LC_MONETARY = "pt_BR.UTF-8";
    LC_NAME = "pt_BR.UTF-8";
    LC_NUMERIC = "pt_BR.UTF-8";
    LC_PAPER = "pt_BR.UTF-8";
    LC_TELEPHONE = "pt_BR.UTF-8";
    LC_TIME = "pt_BR.UTF-8";
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = lib.mkDefault true;

  # https://nixos.wiki/wiki/Storage_optimization
  nix.settings.auto-optimise-store = lib.mkDefault true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # https://flatpak.org/setup/NixOS
  services.flatpak.enable = lib.mkDefault true;

  # Enable CUPS to print documents.
  services.printing.enable = lib.mkDefault true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "br";
    # Idle time (in minutes) to wait until xautolock locks the computer.
    xautolock.time = lib.mkDefault 1;
    xkbVariant = "";
  };

  # https://nixos.org/manual/nixos/stable/options#opt-system.activationScripts
  system.activationScripts = {
    flatpak = "/run/current-system/sw/bin/flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo";
    # git-main = "$DRY_RUN_CMD /run/current-system/sw/bin/git config --global init.defaultBranch main";
  };

  # https://nixos.org/manual/nixos/stable/#sec-upgrading-automatic
  system.autoUpgrade.enable = lib.mkDefault true;

  # Set your time zone.
  time.timeZone = "America/Fortaleza";

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
