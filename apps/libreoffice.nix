{ pkgs, ... }:

let
  office = pkgs.libreoffice-fresh-unwrapped;
in
{
  environment.sessionVariables = {
    PYTHONPATH = "${office}/lib/libreoffice/program";
    URE_BOOTSTRAP = "vnd.sun.star.pathname:${office}/lib/libreoffice/program/fundamentalrc";
  };

  environment.systemPackages = with pkgs; [
    hunspell
    hunspellDicts.en_US
    hunspellDicts.es_ANY
    hunspellDicts.es_CU
    hunspellDicts.fr-any
    hunspellDicts.pt_BR
    libreoffice
  ];
}
