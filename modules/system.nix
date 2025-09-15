{ pkgs, config, ... }:
{
  

  environment.systemPackages = with pkgs; [
    kitty
    vim
    wget
    wofi
  ];

  system.stateVersion = "25.05"; # Did you read the comment?
  nix.settings.experimental-features = ["nix-command" "flakes"];
}