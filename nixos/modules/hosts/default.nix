{ self, ... }: {
  flake.nixosModules.default-environment = {
    imports = [
      self.nixosModules.basic-environment
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
  };
}
