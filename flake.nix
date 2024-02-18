{
  description = "My NixOS config flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      # Sync home-manager package version with nixos version
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = { self, nixpkgs, home-manager, ... } @ inputs:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      nixosConfigurations = {
        styx = lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs; };
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
