{
  description = "Flake for my NixOS Kubernetes Cluster";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-25.05";
    };
  };

  outputs = { self, nixpkgs, ... }: {
    nixosConfigurations = {
      nk0 = nixpkgs.lib.nixosSystem {
        modules = [
          ./hosts/nk0/configuration.nix
        ];
      };

      nk1 = nixpkgs.lib.nixosSystem {
        modules = [
          ./hosts/nk1/configuration.nix
        ];
      };

      nk2 = nixpkgs.lib.nixosSystem {
        modules = [
          ./hosts/nk2/configuration.nix
        ];
      };
    };
  };
}










