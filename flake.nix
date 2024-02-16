{
  description = "My NixOS config flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-23.11";

    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      # Sync home-manager package version with nixos version
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      nixosConfigurations = {
        styx = lib.nixosSystem {
          inherit system;
          modules = [ ./hosts/styx/configuration.nix ];
        };
      };
      
      homeConfigurations = {
        kris = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./home-manager/home.nix ];
        };
      };
    };
}
