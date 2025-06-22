{
  description = "Flake for my NixOS Kubernetes Cluster";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-25.05";
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { self
    , nixpkgs
    , sops-nix
    , ...
    } @ inputs:
    let
      inherit (self) outputs;
      # Supported systems for flake packages, shell, etc.
      systems = [
        "aarch64-linux"
        "i686-linux"
        "x86_64-linux"
        "aarch64-darwin"
        "x86_64-darwin"
      ];
      # This is a function that generates an attribute by calling a function
      # passed to it, with each system as an argument
      forAllSystems = nixpkgs.lib.genAttrs systems;
    in

    {
      nixosConfigurations = {
        nk1 = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [
            ./hosts/nk1/configuration.nix
            ./kubernetes/master.nix
          ];
        };

        nk2 = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [
            ./hosts/nk2/configuration.nix
            ./kubernetes/node.nix
          ];
        };

        nk3 = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [
            ./hosts/nk3/configuration.nix
            ./kubernetes/node.nix
          ];
        };
      };
    };
}










