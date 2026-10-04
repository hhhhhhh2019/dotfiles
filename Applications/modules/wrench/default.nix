{ inputs, ... }: {
  perSystem = { system, pkgs, ... }: let
    pkgsWithStacklock = pkgs.extend inputs.stacklock2nix.overlay;

    version = "0.0.5.2";

    wrench-src = pkgs.fetchFromGitHub {
      owner = "ryukzak";
      repo = "wrench";
      rev = "${version}";
      hash = "sha256-qT5UfvW5qQG1eWa817jwfhmXN+NkeUpWvuqpH1WagDw=";
    };
  in {
    packages.wrench = (pkgsWithStacklock.stacklock2nix {
      stackYaml = "${wrench-src}/stack.yaml";
      baseHaskellPkgSet = pkgs.haskell.packages.ghc96;

      all-cabal-hashes = pkgs.fetchFromGitHub {
        owner = "commercialhaskell";
        repo = "all-cabal-hashes";
        rev = "hackage";
        sha256 = "sha256-vMD6ihucxIzqR+bgbFhBsLHD5jFgrrvRN06oajj4bk0=";
      };
    }).pkgSet.wrench.overrideAttrs (old: {
      pname = "wrench";
    });
  };
}
