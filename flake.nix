{
  description = "My NixOS and Home Manager configuration using flakes";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    flake-utils.url = "github:numtide/flake-utils";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, flake-utils, home-manager, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };
      in {
        packages.default = pkgs.hello;
      }) //
    {
      nixosConfigurations = {
        nixos= nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./hosts/nixos/configuration.nix
            home-manager.nixosModules.home-manager

            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;

              home-manager.users.tabun = import ./home/tabun.nix;
            }
          ];
        };
      };
    };
}

