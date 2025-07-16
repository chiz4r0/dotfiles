{ config, pkgs, ... }:

{
  programs.hyprland.enable = true;
  services.displayManager.defaultSession = "hyprland";
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
  xdg.portal.config.common.default = "hyprland";
}