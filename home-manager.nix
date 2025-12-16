{ lib, pkgs, ... }:

{
  fonts.fontconfig.enable = true;

  home.activation = {
    # backedUpFiles = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    #   BASE_DIR = '.mozilla/firefox/personal';
    #     for file in $(ls $BASE_DIR/*.hm.backup 2>/dev/null); do
    #       baseName=$(basename "$file")
    #       newName=$(echo "$baseName" | sed -E 's/([0-9]+)\.hm\.backup$/echo $((\1 - 1)).hm.backup/e')
    #       mv "$file" $BASE_DIR/"$newName"
    #     done
    # '';
    flatpak = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      $DRY_RUN_CMD /run/current-system/sw/bin/flatpak --user override --filesystem=/run/current-system/sw/share/X11/fonts
      $DRY_RUN_CMD /run/current-system/sw/bin/flatpak --user override --filesystem=$HOME/.icons
    '';
  };

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.vanilla-dmz;
    name = "Vanilla-DMZ";
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
  home.stateVersion = "25.05";
}
