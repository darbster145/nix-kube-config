{
  description = "Flake for my NixOS Kubernetes Cluster";

  inputs = {
    let

    system = "x86_64-linx";

    in

    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-25.05";
    };
  };

  outputs = { self, nixpkgs }:
    {
      nixosConfigurations.nk0 = nixpkgs.lib.nixosSystem {
        system = system
          modules = [

        ];
      };
    };
}
