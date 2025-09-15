{ pkgs, config, ... }:
{
  programs.firefox.enable = true;
  environment.systemPackages = with pkgs; [
    kitty
    vim
    wget
    wofi
  ];
}