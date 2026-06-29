{ self, ... }: {
  flake.nixosModules.default-environment = {
    imports = [
      self.nixosModules.basic-environment
      self.nixosModules.fwupd
      self.nixosModules.documentation
      self.nixosModules.nix-config
      self.nixosModules.plymouth
      self.nixosModules.tlp
      self.nixosModules.iwd
      self.nixosModules.bluetooth
      self.nixosModules.flatpak
      self.nixosModules.printing
      self.nixosModules.tor
      self.nixosModules.i2pd
      self.nixosModules.apple-fonts
    ];

    services.avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
  };
}
