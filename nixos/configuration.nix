{
  config,
  lib,
  pkgs,
  inputs,
  de,
  ...
}: {
  imports = [
    ./hardware.nix
    ./modules/displaylink.nix
    ./modules/font.nix
    ./modules/games.nix
    ./modules/hardware.nix
    #./modules/gnome.nix
    ./modules/hyprland.nix
    ./modules/package.nix
    ./modules/pipewire.nix
    #./modules/plasma.nix
    ./modules/print.nix
    ./modules/networking.nix
    ./modules/system.nix
    ./modules/tlp.nix
    ./modules/users.nix
    ./modules/virtualisation.nix
  ];
}
