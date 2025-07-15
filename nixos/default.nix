{ config, lib, pkgs, inputs, de, ... }:

{
    imports = [
        ./hardware-configuration.nix
        ../modules/core/flatpak.nix 
        ../modules/core/font.nix      
        ../modules/core/games.nix      
        ../modules/core/hardware.nix
        ../modules/core/hyprland.nix
        ../modules/core/package.nix
        ../modules/core/pipewire.nix
        ../modules/core/print.nix
        ../modules/core/networking.nix
        ../modules/core/system.nix
        ../modules/core/tlp.nix
        ../modules/core/users.nix
    ];
}
