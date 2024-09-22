{
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    rust-overlay.url = "github:oxalica/rust-overlay";
    forester = {
      url = "sourcehut:~kentookura/ocaml-forester/nvim-support";
    };
  };
  outputs =
    { self
    , flake-utils
    , nixpkgs
    , forester
    , rust-overlay
    ,
    }:

    flake-utils.lib.eachDefaultSystem (
      system:
      let
        overlays = [ (import rust-overlay) ];
        pkgs = import nixpkgs {
          inherit system overlays;
          config.allowUnfree = true;
        };
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            forester.packages.${system}.default
            nodejs
            python310
            gcc
            (tree-sitter.override (_old: {
              webUISupport = true;
            }))
            topiary
            (rust-bin.stable.latest.default.override {
              extensions = [
                "rust-src"
                "rust-analyzer-preview"
                "rustfmt"
              ];
            })
            nodePackages.typescript-language-server
            typescript
            graphviz
          ];
          shellHook = "export PATH=$PATH:./node_modules/.bin";
        };
      }
    );
}

