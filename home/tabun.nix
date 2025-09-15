{ config, pkgs, ... }:

{
  home.username = "tabun";
  home.homeDirectory = "/home/tabun";

  home.packages = with pkgs; [
    vscode
  ];

  programs.zsh.enable = true;
  programs.git = {
    enable = true;
    userEmail = "yurandarezky@gmail.com";
    userName = "chiz4r0";
  };

  home.stateVersion = "25.05";
}

