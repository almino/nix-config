{ pkgs, ... }:

{
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
