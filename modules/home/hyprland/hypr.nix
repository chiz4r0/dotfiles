{ inputs, pkgs, ... }:
{
  # Hyprland package
  home.packages = (with pkgs; [ 
    brightnessctl
    coreutils
    grim
    htop
    hyprpaper
    pavucontrol
    ranger
    slurp
    swappy
    waybar
    wl-clip-persist
    wl-clipboard
    rofi-wayland  
  ]);

  programs.wlogout.enable = true;
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland = {
      enable = true;
    };
  };

}