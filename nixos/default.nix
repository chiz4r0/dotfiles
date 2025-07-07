{ config, lib, pkgs, inputs, de, ... }:

{
    imports = [
        ./configuration.nix
        ./hardware-configuration.nix
        ./modules/core/users.nix
    ];
}