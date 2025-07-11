
{ config, pkgs, lib, ... }:

{
  imports = [
    ./plugins/colorschema.nix
  ];

  programs.nixvim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    plugins.lualine.enable = true;
  };
}
