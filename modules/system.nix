{ pkgs, config, ... }:
{
  programs.firefox.enable = true;
  programs.gamescope.enable = true;
  programs.gamemode.enable = true;
  services.flatpak.enable = true;
  environment.systemPackages = with pkgs; [
    vim
    winePackages.stable
    winetricks
    wget
    wofi
  ];
}
