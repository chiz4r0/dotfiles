{ config, lib, pkgs, ... }:

{
  fonts.packages = with pkgs; [
    noto-fonts
    league-gothic
    adwaita-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    corefonts
    font-awesome
    source-han-sans
    source-han-sans-japanese
    source-han-serif-japanese
    powerline-fonts
    powerline-symbols
  ] ++ builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);
}