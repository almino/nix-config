{ pkgs, ... }:

{
  programs.firefox = {
    enable = true;
    languagePacks = [ "pt-BR" "en-US" ];
    policies = {
      AutofillAddressEnabled = true;
      AutofillCreditCardEnabled = false;
      Bookmarks = [{
        Title = "Home Manager Configuration Options";
        URL = "https://nix-community.github.io/home-manager/options.xhtml";
      }];
      DisableFirefoxAccounts = false;
      DisableFirefoxScreenshots = false;
      DisableFormHistory = false;
      DisablePocket = true;
      DisableSetDesktopBackground = true;
      DontCheckDefaultBrowser = true;
      ExtensionUpdate = true;
      FirefoxHome = {
        Highlights = true;
        Locked = false;
        Pocket = false;
        Search = true;
        Snippets = true;
        SponsoredPocket = false;
        SponsoredTopSites = false;
        TopSites = true;
      };
      FirefoxSuggest = {
        ImproveSuggest = true;
        Locked = false;
        SponsoredSuggestions = false;
      };
      Homepage.StartPage = "previous-session";
      HttpAllowlist = [
        "http://192.168.78.1" # mikortik
        "http://192.168.78.2" # desktop servarr
        "http://192.168.78.4" # wi-fi xiaomi
        "http://desktop.lan" # desktop servarr
        "http://desktop" # desktop servarr
        "http://localhost"
        "http://router.lan" # mikortik
        "http://servar.lan" # desktop servarr
      ];
      NetworkPrediction = true;
      OfferToSaveLoginsDefault = false;
      PasswordManagerEnabled = true;
      PasswordManagerExceptions = [
        "http://localhost"
      ];
      PictureInPicture = true;
      PrimaryPassword = true;
      PromptForDownloadLocation = true;
      RequestedLocales = [ "pt-BR" "pt" "en-US" "en" ];
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
          IconURL = "https://wiki.nixos.org/favicon.ico";
          definAliasedAliases = "nw";
        }
      ];
      SearchSuggestEnabled = true;
    };
    preferences = import ../options/firefox.nix;
    preferencesStatus = "default";
  };
}
