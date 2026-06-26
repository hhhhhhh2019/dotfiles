{ inputs, self, ... }: {
  flake.nixosConfigurations.nitro-an16-51 = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      inputs.preservation.nixosModules.default
      self.nixosModules.nitro-an16-51-hardware
      self.nixosModules.nitro-an16-51-configuration
      #self.nixosModules.nitro-an16-51-preservation
      self.nixosModules.nix-config
      self.nixosModules.bluetooth
      self.nixosModules.default-environment
      self.nixosModules.intel-graphics
      self.nixosModules.apple-fonts
      self.nixosModules.flatpak
      self.nixosModules.printing
      #self.nixosModules.vpn
      self.nixosModules.tor
      self.nixosModules.i2pd
      self.nixosModules.gnome
    ];
  };
}
