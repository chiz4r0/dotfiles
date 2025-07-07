{ config, pkgs, ... }:
{
  programs.git = {
    enable = true;
    userEmail = "yurandarezky@gmail.com";
    userName = "chiz4r0";
  };
}