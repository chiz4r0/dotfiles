{ pkgs, config, ... }:
{
  programs.firefox.enable = true;
  environment.systemPackages = with pkgs; [
    vim
    wget
    wofi
  ];
}