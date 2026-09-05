{ inputs, ... }: {
  perSystem = { system, pkgs, ... }: {
    packages.doom-emacs = inputs.nix-doom-emacs.packages.${system}.doom-emacs.override {
      doomDir = ./doom;
      emacs = pkgs.emacs-pgtk;
    };
  };
}
