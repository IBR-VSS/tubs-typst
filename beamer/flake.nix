{
  description = "Typst flake";
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nexus-fonts = {
      url = "git+ssh://git@gitlab.ibr.cs.tu-bs.de/vss/meta/nexus-fonts?ref=main";
      flake = false;
    };
  };

  outputs =
    {
      self,
      flake-utils,
      nixpkgs,
      nexus-fonts,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        devShells.default =
          with pkgs;
          mkShell {
            name = "typst-shell";
            packages = [
              typst
              tinymist
              pdfpc
            ];
            TYPST_FONT_PATHS = "${nexus-fonts}";
            shellHook = ''
              unset SOURCE_DATE_EPOCH
            '';
          };
      }
    );
}
