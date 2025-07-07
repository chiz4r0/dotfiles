{ pkgs, ... }:
{
  home.packages = (with pkgs; [ 
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
    # theme = {
    #   package = pkgs.flat-remix-gtk;
    #   name = "Flat-Remix-GTK-Grey-Darkest";
    # };

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