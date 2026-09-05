{ inputs, ... }: {
  perSystem = { system, pkgs, ... }: let
    pkgsWithStacklock = pkgs.extend inputs.stacklock2nix.overlay;

    version = "0.0.5.0";

    wrench-src = pkgs.fetchFromGitHub {
      owner = "ryukzak";
      repo = "wrench";
      rev = "${version}";
      hash = "sha256-4A+CnqqvRD2KE4uUORTii6h1XR0VMwMVXqHdK0atipg=";
    };
  in {
    packages.wrench = (pkgsWithStacklock.stacklock2nix {
      stackYaml = "${wrench-src}/stack.yaml";
      baseHaskellPkgSet = pkgs.haskell.packages.ghc96;

      all-cabal-hashes = pkgs.fetchFromGitHub {
        owner = "commercialhaskell";
        repo = "all-cabal-hashes";
        rev = "hackage";
        sha256 = "sha256-hcjm+mXIpQDNvSpqxx59yQRfVX77Aa5NO9uME3mN9O4=";
      };
    }).pkgSet.wrench;
  };
}
