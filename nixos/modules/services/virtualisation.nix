{
  flake.nixosModules.virtualisation = { pkgs, ... }: {
    environment.systemPackages = [ pkgs.wl-clipboard ];

    virtualisation = {
      #tpm.enable = true;
      #useSecureBoot = true;
      libvirtd = {
        enable = true;
        dbus.enable = true;
      };
      podman = {
        enable = true;
        dockerCompat = true;
      };
      waydroid = {
        enable = true;
        package = pkgs.waydroid-nftables;
      };
    };
  };
}
