{ pkgs, ... }:

{
  programs.firefox = {
    enable = true;
    languagePacks = [ "pt-BR" "en-US" ];
    policies = {
      DisablePocket = true;
      DisableSetDesktopBackground = true;
      FirefoxHome = {
        SponsoredTopSites = false;
        Pocket = false;
        SponsoredPocket = false;
      };
      FirefoxSuggest.SponsoredSuggestions = false;
      Homepage.StartPage = "previous-session";
      PasswordManagerExceptions = [
        "http://localhost"
      ];
      PromptForDownloadLocation = true;
      RequestedLocales = ["pt-BR" "pt" "en-US" "en"];
      SearchEngines.Add = [
        {
          Name = "Home Manager Options";
          URLTemplate = "https://mipmip.github.io/home-manager-option-search/?query={searchTerms}";
          IconURL = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
          Alias = "hm";
        }
        {
          Name = "NixOS Wiki";
          URLTemplate = "https://wiki.nixos.org/index.php?search={searchTerms}";
          IconURL = "https://wiki.nixos.org/favicon.png";
          definAliasedAliases = "nw";
        }
      ];
    };
  };
}
