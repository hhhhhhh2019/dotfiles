{ inputs, ... }: {
  flake.nixosModules.apple-fonts = { pkgs, ... }: {
    fonts = {
      packages = [
        inputs.apple-fonts.packages.${pkgs.system}.sf-pro
        inputs.apple-fonts.packages.${pkgs.system}.sf-mono
      ];

      fontconfig.defaultFonts = {
        serif = [ "SF Pro Display" ];
        sansSerif = [ "SF Pro Display" ];
        monospace = [ "SF Mono" ];
      };
    };
  };
}
