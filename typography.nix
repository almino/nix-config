{ pkgs, ... }:

{
  # !! NÃO altere as linhas ACIMA !!

  fonts.fontconfig.defaultFonts = {
    serif = [ "Roboto Slab" "Roboto Slab" ];
    sansSerif = [ "Fira Sans" "Ubuntu" ];
    monospace = [ "FiraMono Nerd Font" "Cascadia" "Ubuntu Mono" ];
  };

  # https://nixos.wiki/wiki/Fonts#:~:text=fonts%5B2%5D-,Flatpak%20applications%20can%27t%20find%20system%20fonts,-Enable%20fontDir%20in
  fonts.fontDir.enable = true;

  # https://nixos.wiki/wiki/Fonts#Installing_fonts_on_NixOS
  fonts.packages = with pkgs; [
    caladea # A serif font metric-compatible with Microsoft Cambria
    carlito # A sans-serif font metric-compatible with Microsoft Calibri
    cascadia-code # https://github.com/microsoft/cascadia-code
    corefonts # Microsoft's TrueType core fonts for the Web
    dina-font
    fira
    fira-code
    fira-code-symbols
    hasklig
    liberation_ttf # Liberation Fonts, replacements for Times New Roman, Arial, and Courier New
    liberation-sans-narrow # Liberation Sans Narrow Font Family is a replacement for Arial Narrow
    nerd-fonts.fira-code
    nerd-fonts.fira-mono
    noto-fonts
    noto-fonts-emoji
    proggyfonts
    roboto
    roboto-mono
    roboto-serif
    roboto-slab
    ubuntu_font_family
    vistafonts # Some TrueType fonts from Microsoft Windows Vista (Calibri, Cambria, Candara, Consolas, Constantia, Corbel)
  ];

  # !! NÃO altere as linhas ABAIXO !!
}
