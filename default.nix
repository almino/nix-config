# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ lib, pkgs, ... }:

{
  # Configure console keymap
  console.keyMap = "br-abnt2";

  # https://t.me/c/1859437962/31
  # https://search.nixos.org/options?query=boot.loader.grub.configurationLimit
  boot.loader.grub.configurationLimit = lib.mkDefault 8;
  # https://search.nixos.org/options?query=boot.loader.systemd-boot.configurationLimit
  boot.loader.systemd-boot.configurationLimit = lib.mkDefault 5;

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  environment.systemPackages = with pkgs; [
    nextcloud-client
  ];

  home-manager.backupFileExtension =
    (builtins.toString builtins.currentTime) + ".hm.backup";

  imports = [
    # Include the results of the hardware scan.
    /etc/nixos/hardware-configuration.nix
    ./apps.nix
    ./este-pc
    ./sound.nix
    ./typography.nix
    ./users.nix
    <home-manager/nixos>
  ];

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

  # Enable networking
  networking.networkmanager.enable = lib.mkDefault true;

  nix.extraOptions =
    let
      min = toString (1024 * 1024 * 1024); # 1 GiB
      max = toString (1024 * 1024 * 1024); # 1 GiB
    in
    ''
      min-free = ${min}
      max-free = ${max}
    '';

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  nix.optimise.automatic = true;
  # https://nixos.wiki/wiki/Storage_optimization
  nix.settings.auto-optimise-store = lib.mkDefault true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = lib.mkDefault true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

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
    # Idle time (in minutes) to wait until xautolock locks the computer.
    xautolock.time = lib.mkDefault 1;
    xkb = {
      layout = "br";
      variant = "";
    };
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
