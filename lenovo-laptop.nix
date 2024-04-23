# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ ... }:

{
  home-manager.users = {
    almino = import
                ./almino/hm/me.lenovo-laptop.nix;
    edileuza = import ./home-manager.nix;
  };

  imports = [
    ./almino
    ./almino/apps/tmux.nix
    ./cinnamon.nix
    ./private/apps/tailscale.nix
    ./touchpad.nix
    <home-manager/nixos>
  ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.edileuza = {
    description = "Edileuza";
    extraGroups = [ "networkmanager" ];
    initialPassword = "123456";
    isNormalUser = true;
  };
}
