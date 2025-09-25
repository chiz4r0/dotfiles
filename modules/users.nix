{ pkgs, config, ... }:
{
  security.sudo.wheelNeedsPassword = false;
  programs.zsh.enable = true;
  users.users.r3z = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [ "wheel" "audio" "video" "disk" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      tree
    ];
  };
}
