
{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [ ripgrep fd lua fzf luarocks ];
  xdg.configFile."nvim/init.lua".source= ./lazy/init.lua;
  xdg.configFile."nvim/lua".source = ./lazy/lua;
  programs.neovim = {
    enable = true;
    vimAlias = true;
    vimdiffAlias = true;
    withNodeJs = true;
    extraPackages = with pkgs; [
      gcc
      cmake
      vimPlugins.telescope-fzf-native-nvim
      gnumake
    ];
  };
}
