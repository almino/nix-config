{ lib, ... }:

{
  home.activation = {
    flatpak = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      $DRY_RUN_CMD /run/current-system/sw/bin/flatpak --user override --filesystem=/run/current-system/sw/share/X11/fonts
      $DRY_RUN_CMD /run/current-system/sw/bin/flatpak --user override --filesystem=$HOME/.icons
    '';
  };

  # https://mozilla.github.io/policy-templates/#disablepocket
  programs.firefox.policies.DisablePocket = true;

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.11";
}
