{
  flake.nixosModules.edl = {
    services.udev.extraRules = ''
      SUBSYSTEM=="usb", ATTRS{idVendor}=="05c6", ATTRS{idProduct}=="9008", MODE="0666"
    '';
  };
}
