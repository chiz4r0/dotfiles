
{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [ ripgrep fd ];


#  xdg.configFile."nvim/lua/plugins/example.lua".source = ./config/lua/plugins/colorscheme.lua;
  xdg.configFile."nvim/init.lua".source = ./config/init.lua;
  programs.neovim = {
    enable = true;
    vimAlias = true;
    vimdiffAlias = true;
    withNodeJs = true;
  };
}
