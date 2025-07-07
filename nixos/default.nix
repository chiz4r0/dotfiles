{ config, lib, pkgs, inputs, de, ... }:

{
    imports = [
        ./configuration.nix
        ./hardware-configuration.nix
        ../modules/core/networking.nix
        ../modules/core/system.nix
        ../modules/core/users.nix
    ];
}