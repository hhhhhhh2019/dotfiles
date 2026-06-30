{
  flake.nixosModules.nix-config = {
    nix.gc = {
      automatic = true;
      persistent = true;
    };

    nix.optimise = {
      automatic = true;
      persistent = true;
    };

    nix.settings = {
      auto-optimise-store = true;
      experimental-features = [ "flakes" "nix-command" ];
    };

    nixpkgs.config = { allowUnfree = true; };
  };
}
