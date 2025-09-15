{config, lib, pkgs, ...} :
{
  programs.alacritty = {
    enable = true;
    # settings = {
    #     terminal.shell = {
    #     args = ["new-session"  "-A"  "-D" "-s" "main"];
    #     program = "/etc/profiles/per-user/${config.home.username}/bin/tmux";
    #   };
    # };
}