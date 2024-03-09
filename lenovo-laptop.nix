# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.edileuza = {
    isNormalUser = true;
    description = "Edileuza";
    extraGroups = [ "networkmanager" ];
  };

  home-manager.users.almino =
    import ./almino/hm/me.lenovo-laptop.nix;
  home-manager.users.edileuza =
    import ./home-manager.nix;

  imports = [
    ./almino
    ./cinnamon.nix
    ./touchpad.nix
    <home-manager/nixos>
  ];
}
