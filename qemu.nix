{ pkgs, ... }:

{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    qemu
    quickemu
  ];

  programs.virt-manager.enable = true;

  systemd.tmpfiles.rules = [ "L+ /var/lib/qemu/firmware - - - - ${pkgs.qemu}/share/qemu/firmware" ];

  users.users.almino.extraGroups = [ "libvirtd" ];

  virtualisation.libvirtd.enable = true;
}
