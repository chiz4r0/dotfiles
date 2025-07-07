{ config, lib, pkgs, ... }:

{
  services.printing.enable = true;
  services.printing.drivers = [
    (pkgs.epson-201401w)
  ];
}