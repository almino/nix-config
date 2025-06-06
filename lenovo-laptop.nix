# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, ... }:

{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = [
    (pkgs.wrapOBS {
      plugins = with pkgs.obs-studio-plugins; [
        droidcam-obs
        # obs-backgroundremoval
        obs-pipewire-audio-capture
        wlrobs
      ];
    })
  ];

  home-manager.users = {
    almino = import
      ./almino/hm/me.lenovo-laptop.nix;
    edileuza = import ./hm/lenovo-laptop.hm.nix;
  };

  imports = [
    ./almino
    # ./almino/apps/android-studio.nix
    ./cinnamon.nix # includes default.nix
    ./private/apps/tailscale.nix
    ./touchpad.nix
    <home-manager/nixos>
    <nixos-hardware/common/cpu/intel/sandy-bridge>
  ];

  networking.hostName = "lenovo-s145"; # Define your hostname.

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.edileuza = {
    description = "Edileuza";
    extraGroups = [ "networkmanager" ];
    initialPassword = "123456";
    isNormalUser = true;
  };
}
