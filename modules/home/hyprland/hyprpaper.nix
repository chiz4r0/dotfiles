{ config, lib, pkgs, ... }:
{
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = false;
      splash_offset = 2.0;
      preload = [
        "/data/Pictures/guitar.jpg"
      ];
      wallpaper = [
        "eDP-1,/data/Pictures/guitar.jpg"
        ",/data/Pictures/guitar.jpg"
      ];
    };
  };
}