{ pkgs, config, ... }:
{
  home.packages = with pkgs; [
    vscode
    telegram-desktop
  ];
}
