{ config, lib, pkgs,  ... }:

{
  networking.hostName = "cat-linux"; 
  networking.networkmanager.enable = true; 
  networking.wireguard.enable = true;
  services.resolved.enable = true;
  environment.systemPackages = [
    pkgs.samba
    pkgs.wireguard-tools
  ];
}
