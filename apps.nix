{ pkgs, ... }:

{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    chromium
    firefox
    git
    google-chrome
    home-manager
    libreoffice
    nanorc
    service-wrapper
    telegram-desktop
    thunderbird
    vlc
  ];

  # Allow unfree packages
  # nixpkgs.config.allowUnfree = true;
  # https://nixos.wiki/wiki/Chromium#For_NixOS
  nixpkgs.config =
    let
      # https://nixos.wiki/wiki/Chromium#Enabling_native_Wayland_support
      # In earlier versions you can enable wayland support by setting the appropriate command-line flags:
      # nixpkgs.config.chromium.commandLineArgs = "--enable-features=UseOzonePlatform --ozone-platform=wayland";
      chromiumArgs = [
        # https://askubuntu.com/a/295650/63408
        "--ash-host-window-bounds"
        # "--disable-default-apps"
        "--enable-features=UseOzonePlatform"
        # "--force-device-scale-factor=1.20"
        "--ozone-platform=wayland"
      ];
      # VA-API is enabled by default now in Chromium. Check chrome://gpu if it is working and if VA is detected. You may need to enable Hardware-accelerated video decode in chrome://flags.
      # chrome://gpu/
      # chrome://settings/system
    in
    {
      allowUnfree = true;

      chromium.commandLineArgs = chromiumArgs;

      firefox = {
        enableGoogleTalkPlugin = true;
        # enableAdobeFlash = true;
      };

      google-chrome.commandLineArgs = chromiumArgs;
    };

}
