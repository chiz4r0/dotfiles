{
  config,
  lib,
  pkgs,
  ...
}: {
  nixpkgs.config.allowUnfree = true;
  programs.firefox.enable = true;
  programs.zsh.enable = true;
  programs.dconf.enable = true;
  environment.systemPackages = with pkgs; [
    git
    kitty
    wget

    #
    unzip
    unrar
    gzip
  ];
}
