{
  flake.nixosModules.documentation = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [ man-pages man-pages-posix ];

    documentation = {
      enable = true;
      dev.enable = true;
      doc.enable = true;
      info.enable = true;
      man = {
        enable = true;
        cache.enable = true;
        mandoc.enable = true;
        man-db.enable = false;
      };
      nixos.enable = true;
    };
  };
}
