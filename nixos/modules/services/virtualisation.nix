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
        dbus.enable = true;
        qemu.swtpm.enable = true;
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
