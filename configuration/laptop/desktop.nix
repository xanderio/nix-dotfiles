{pkgs, ...}: {
  programs = {
    sway.enable = true;
    fish = {
      enable = true;
      shellAliases = {};
    };
    dconf.enable = true;
    file-roller.enable = true;
    gnome-disks.enable = true;
  };

  environment.systemPackages = with pkgs; [
    swaylock
    gnome-icon-theme
    hicolor-icon-theme # default fallback for icons
    gnome3.adwaita-icon-theme
    gnome.gnome-themes-extra

    gnomeExtensions.appindicator
    networkmanagerapplet # needed for icons to work
    iwgtk # icons

    gnome.gnome-system-monitor
    gnome.nautilus
  ];

  gtk.iconCache.enable = true;

  services = {
    udev.packages = with pkgs; [gnome3.gnome-settings-daemon];
    gvfs.enable = true;
    gnome = {
      gnome-keyring.enable = true;
      sushi.enable = true;
    };

    pipewire = {
      enable = true;
      pulse.enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
    };
  };

  xdg.portal.wlr = {
    enable = true;
    settings = {
      screencast = {
        exec_before = "${pkgs.mako}/bin/makoctl set-mode do-not-disturb";
        exec_after = "${pkgs.mako}/bin/makoctl set-mode default";
        chooser_type = "simple";
        chooser_cmd = "''${pkgs.slurp}/bin/slurp -f %o -or";
      };
    };
  };
}
