{
  flake.nixosModules.iwd = {
    networking.wireless.iwd.enable = true;
    networking.networkmanager.wifi.backend = "iwd";
  };
}
