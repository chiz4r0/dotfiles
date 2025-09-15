{ pkgs, config, ... }:
{
  security.sudo.wheelNeedsPassword = false;
  program.zsh.enable = true;
  users.users.tabun = {
    isNormalUser = true;
    bash = pkgs.zsh;
    extraGroups = [ "wheel" "audio" "video" "disk" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      tree
    ];
  };
}