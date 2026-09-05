{
  flake.nixosModules.virtualisation = { pkgs, ... }: {
    environment.systemPackages = with pkgs;[
      wl-clipboard
      virt-manager
      guestfs-tools
      virtiofsd
    ];

    virtualisation = {
      libvirtd = {
        enable = true;
        parallelShutdown = 3;
        dbus.enable = true;
        qemu.swtpm.enable = true;
      };
      podman = {
        enable = true;
        dockerCompat = true;
      };
      waydroid = {
        enable = false;
        package = pkgs.waydroid-nftables;
      };
    };

    systemd.services.libvirtd = {
      requires = [ "libvirtd-config.service" ];
      after = [ "libvirtd-config.service" ];

      serviceConfig = {
        LoadCredentialEncrypted = "";
        Environment = "LIBVIRTD_ARGS=\"--timeout 120\"";
      };
    };
  };
}
