{ config, pkgs, lib, ... }:

{
  programs.nixvim.colorschemes.catppuccin = {
    enable = true;
    settings.transparent_background = true;
  };
}
