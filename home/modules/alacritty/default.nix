{ config, pkgs, ... }:

let
  MyAliases = {
    ll = "ls -l";
    update = "sudo nixos-rebuild switch --flake /data/dotfiles";
    upgrade = "nix flake update --flake /data/dotfiles && sudo nixos-rebuild switch --flake /data/dotfiles";
  };
in

{
  programs.alacritty = {
    enable = true;
    settings = {
      window.dimensions = {
        lines = 3;
        columns = 200;
      };
      window.padding = {
        x = 8;
        y = 0;
      };
      window.opacity = 0.9;
      window.blur = true;
      window.title = "Welcome Lah";
      scrolling.history = 10000;
      font.normal = {
        family = "JetBrains Mono";
        style = "Regular";
      };
      font.bold = {
        family = "JetBrains Mono";
        style = "Bold";
      };
      font.italic = {
        family = "Jetbrains Mono";
        style = "Italic";
      };
      font.size = 12;
    };
  };
}
