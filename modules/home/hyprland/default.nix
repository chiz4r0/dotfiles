{ inputs, ... }:
{
  imports = [
    ./config.nix
    ./gtk.nix
    ./hypr.nix
    ./hypridle.nix
    ./hyprlock.nix
    ./hyprpaper.nix
    ./variable.nix
    ./waybar.nix
  ];
  
}