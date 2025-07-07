
{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    package = pkgs.neovim-nightly;
    vimAlias = true;
    vimdiffAlias = true;
    withNodeJs = true;
  };
}