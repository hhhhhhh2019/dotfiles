{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:denful/import-tree";
    preservation.url = "github:nix-community/preservation";
    apple-fonts.url= "github:Lyndeno/apple-fonts.nix";
    nix-flatpak.url = "github:gmodena/nix-flatpak";
  };
  outputs = inputs: inputs.flake-parts.lib.mkFlake
    { inherit inputs; }
    (inputs.import-tree ./modules);
}
