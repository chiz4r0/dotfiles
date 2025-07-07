{ config, lib, ... }:

{
  networking.hostName = "cat-linux"; 
  networking.networkmanager.enable = true; 
  networking.wireguard.enable = true;
  services.resolved.enable = true;
}