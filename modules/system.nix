{ pkgs, config, ... }:
{
  programs.firefox.enable = true;
  environment.systemPackages = with pkgs; [
    vim
    winePackages.stable
    winetricks
    wget
    wofi
  ];
}