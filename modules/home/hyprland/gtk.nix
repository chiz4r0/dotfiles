{ pkgs, ... }:
{
  home.packages = (with pkgs; [ 
    gnome-themes-extra
    bibata-cursors
    flat-remix-gtk
    adwaita-icon-theme
  ]);

  home.pointerCursor = {
    gtk.enable = true;
    # x11.enable = true;
    package = pkgs.xorg.xcursorthemes;
    name = "Adwaita";
    size = 24;
  };

  gtk = {
    enable = true;
    theme.name = "Adwaita-dark";

    iconTheme = {
      package = pkgs.adwaita-icon-theme;
      name = "Adwaita";
    };

    font = {
      name = "Adwaita Sans";
      size = 11;
    };
  };
}
