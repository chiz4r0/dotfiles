{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    gnomeExtensions.blur-my-shell
    fluent-icon-theme
  ];

  dconf.enable = true;
  dconf.settings = {
    "org/gnome/desktop/background" = {
      color-shading-type = "solid";
      picture-uri = "file:///data/Pictures/grum.jpg";
      picture-uri-dark = "file:///data/Pictures/grum.jpg";
    };

    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      icon-theme = "Fluent";
    };

    "org/gnome/mutter" = {
      experimental-features = [
        "scale-monitor-framebuffer"
        "xwayland-native-scaling"
      ];
    };

    "org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = with pkgs.gnomeExtensions; [
        blur-my-shell.extensionUuid
      ];
    };
  };
}