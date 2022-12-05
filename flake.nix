{
  description = "School CPM NixOS configurations";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.11";

    flake-utils.url = "github:numtide/flake-utils";

    home-manager = {
      url = "github:nix-community/home-manager/release-22.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    impermanence.url = "github:nix-community/impermanence";

    averyanalex = {
      url = "github:averyanalex/nixcfg";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-utils.follows = "flake-utils";
      inputs.home-manager.follows = "home-manager";
      inputs.impermanence.follows = "impermanence";
    };
  };

  outputs = { self, nixpkgs, flake-utils, ... }@inputs:
    let
      findModules = dir:
        builtins.concatLists (builtins.attrValues (builtins.mapAttrs
          (name: type:
            if type == "regular" then [{
              name = builtins.elemAt (builtins.match "(.*)\\.nix" name) 0;
              value = dir + "/${name}";
            }] else if (builtins.readDir (dir + "/${name}"))
              ? "default.nix" then [{
              inherit name;
              value = dir + "/${name}";
            }] else
              [{
                inherit name;
                value = builtins.listToAttrs (findModules (dir + "/${name}"));
              }])
          (builtins.readDir dir)));
    in
    {
      nixosModules.profiles = builtins.listToAttrs (findModules ./profiles);
      nixosModules.hardware = builtins.listToAttrs (findModules ./hardware);
      nixosModules.roles = builtins.listToAttrs (findModules ./roles);

      nixosConfigurations = {
        board = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./board.nix
          ];
          specialArgs = { inherit inputs; };
        };
      };
    } // flake-utils.lib.eachSystem (with flake-utils.lib.system; [ x86_64-linux aarch64-linux ])
      (system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        {
          devShells.default = pkgs.mkShell {
            buildInputs = [ ];
          };
        });
}
