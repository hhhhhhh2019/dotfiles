{ inputs, self, ... }: {
  flake.nixosModules.nitro-an16-51-preservation = {
    preservation = {
      enable = true;

      preserveAt."/persist" = {
        files = [
          "/etc/machine-id"
        ];

        directories = [
          "/etc/NetworkManager/system-connections"
          "/var/lib/i2pd"
          "/var/lib/flatpak"
        ];
      };
    };
  };
}
