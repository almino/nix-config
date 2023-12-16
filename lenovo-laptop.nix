# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ ... }:

{
  home-manager.users.almino =
    import ./almino/hm/me.lenovo-laptop.nix;

  imports = [
    ./almino
    ./cinnamon.nix
    ./private/lenovo-laptop.nix
    ./touchpad.nix
    <home-manager/nixos>
  ];
}
