{ config, lib, pkgs, inputs, de, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      # ./hardware-configuration.nix
      inputs.home-manager.nixosModules.home-manager
    ];
  nixpkgs.config.allowUnfree = true;

  security.sudo.wheelNeedsPassword = false;

  users.users.tabun = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [ "network" "wheel" "audio" "video" "disk" ];
    packages = with pkgs; [
      tree
    ];
  };

  ### Home Manager
  home-manager = {
    
    useUserPackages = true;
    useGlobalPkgs = true;
    users.tabun = {  
      imports = [
        ../../home/home.nix
        inputs.nvf.homeManagerModules.default
      ];
      home.username = "tabun";
      home.homeDirectory = "/home/tabun";
      home.stateVersion = "24.05";
      programs.home-manager.enable = true;
    };
  };
}
