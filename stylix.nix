{ pkgs, ... }:

let
  sources = import ./nix/sources.nix;
in
{
  imports = [ (import sources.stylix).nixosModules.stylix ];

  stylix = {
    base16Scheme =
      # "${pkgs.base16-schemes}/share/themes/solarized-light.yaml";
      "${pkgs.base16-schemes}/share/themes/spaceduck.yaml";
    cursor = {
      name = "Bibata Cursor";
      package = pkgs.bibata-cursors;
      # name = "Bibata Translucent";
      # package = pkgs.bibata-cursors-translucent;
      # name = "Capitaine Cursor";
      # package = pkgs.capitaine-cursors-themed;
    };
    enable = true;
    # image = ./wallpaper.jpg;
    fonts = {
      emoji = {
        name = "Noto Color Emoji";
        package = pkgs.noto-fonts-emoji;
      };
      monospace = {
        name = "Cascadia Code";
        package = pkgs.cascadia-code;
      };
      sansSerif = {
        name = "Fira Sans";
        package = pkgs.fira-sans;
      };
      serif = {
        name = "Roboto Slab";
        package = pkgs.roboto-slab;
      };
      sizes = {
        applications = 12;
        desktop = 10;
        terminal = 11;
      };
    };
    targets.grub.enable = true;
  };
}

