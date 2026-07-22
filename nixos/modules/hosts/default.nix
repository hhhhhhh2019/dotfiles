{ self, ... }: {
  flake.nixosModules.default-environment = { pkgs, ... }: {
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
      self.nixosModules.desktop-network
      self.nixosModules.apple-fonts
      self.nixosModules.video
      self.nixosModules.music
    ];

    services.avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };

    hardware.i2c.enable = true;
    environment.systemPackages = with pkgs; [
      ddcutil
    ];

    #services.automatic-timezoned.enable = true;
  };
}
