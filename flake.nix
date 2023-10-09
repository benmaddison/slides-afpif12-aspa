{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.05";
    flake-utils.url = "github:numtide/flake-utils";
    builder = {
      url = "github:benmaddison/slides-template";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-utils.follows = "flake-utils";
      };
    };
  };

  outputs = { self, ... } @ inputs:
    let
      inherit (inputs.builder.lib) systems;
      code = _: s: s;
    in
    inputs.flake-utils.lib.eachSystem systems (system:
      let
        pkgs = inputs.nixpkgs.legacyPackages.${system};
        lib = inputs.builder.lib.mkLib pkgs;
        src = ./src;
      in
      rec {
        packages = rec {
          default = html;

          pdf = lib.buildPdf { inherit src; };
          html = lib.buildHtml { inherit src; };

          lint = lib.lint { inherit src; config = ./.markdownlint.yml; };
          spell = lib.spell { inherit src; config = ./cspell.yaml; };
        };

        devShells.default = lib.watch { };

        checks = {
          inherit (packages) lint spell;
        };
      }
    );
}
