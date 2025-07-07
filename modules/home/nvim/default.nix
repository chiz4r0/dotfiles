
{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [ ripgrep fd gcc lua luarocks ];

  xdg.configFile."nvim/init.lua".source = ./lazy/init.lua;

  xdg.configFile."nvim/lua/config/lazy.lua".source = ./lazy/lua/config/lazy.lua;
  xdg.configFile."nvim/lua/config/keymaps.lua".source = ./lazy/lua/config/keymaps.lua;
  xdg.configFile."nvim/lua/config/options.lua".source = ./lazy/lua/config/options.lua;
  xdg.configFile."nvim/lua/config/autocmds.lua".source = ./lazy/lua/config/autocmds.lua;

  xdg.configFile."nvim/lua/plugins/example.lua".source = ./lazy/lua/plugins/example.lua;
  xdg.configFile."nvim/lua/plugins/colors.lua".source = ./lazy/lua/plugins/colors.lua;

  programs.neovim = {
    enable = true;
    vimAlias = true;
    vimdiffAlias = true;
    withNodeJs = true;
  };
}
