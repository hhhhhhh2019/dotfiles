{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nix-doom-emacs.url = "github:marienz/nix-doom-emacs-unstraightened";
  };

  outputs = { self, nixpkgs, nix-doom-emacs }: let
    pkgs = import nixpkgs { system = "x86_64-linux"; };
  in {
    packages.x86_64-linux.default = nix-doom-emacs.packages.x86_64-linux.doom-emacs.override {
      doomDir = ./doom;
      emacs = pkgs.emacs-pgtk;
    };
  };
}
