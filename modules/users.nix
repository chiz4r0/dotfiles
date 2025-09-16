{ pkgs, config, ... }:
{
  security.sudo.wheelNeedsPassword = false;
  programs.zsh.enable = true;
  users.users.tabun = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [ "wheel" "audio" "video" "disk" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      tree
    ];
  };
}