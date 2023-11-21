{ pkgs, ... }:

{
  # !! NÃO altere as linhas ACIMA !!

  # https://nixos.wiki/wiki/Fonts#Installing_fonts_on_NixOS
  fonts.fonts = with pkgs; [
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

  # https://nixos.wiki/wiki/Fonts#:~:text=fonts%5B2%5D-,Flatpak%20applications%20can%27t%20find%20system%20fonts,-Enable%20fontDir%20in
  fonts.fontDir.enable = true;

  # !! NÃO altere as linhas ABAIXO !!
}
