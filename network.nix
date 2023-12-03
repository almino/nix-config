{ lib, ... }:

{
  # https://nlewo.github.io/nixos-manual-sphinx/configuration/ipv6-config.xml.html#ipv6-configuration
  networking.enableIPv6 = lib.mkDefault false;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = lib.mkDefault true;
    };
  };
}
