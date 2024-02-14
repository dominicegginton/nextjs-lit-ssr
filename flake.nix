{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/master";
  inputs.systems.url = "github:nix-systems/default";
  inputs.napalm.url = "github:nix-community/napalm";

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    systems,
    napalm,
  }:
    flake-utils.lib.eachSystem (import systems) (
      system: let
        inherit (pkgs.stdenv) isLinux;
        inherit (pkgs.lib) optional;
        pkgs = import nixpkgs { inherit system; };
        nodejs = pkgs.nodejs_20;
      in {
        packages = {
          default = napalm.legacyPackages.${system}.buildPackage ./. {
            inherit nodejs;
            installPhase = ''
              npm run build
              ${pkgs.coreutils}/bin/cp -r .next $out
            '';
          };
        };

        devShells = {
          default = pkgs.mkShell {
            packages = [nodejs];
          };
        };
      }
    );
}
