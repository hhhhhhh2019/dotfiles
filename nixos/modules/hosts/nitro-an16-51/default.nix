  { inputs, self, ... }: {
    flake.nixosConfigurations.nitro-an16-51 = inputs.nixpkgs.lib.nixosSystem {
      modules = [
        self.nixosModules.default-environment
        self.nixosModules.secureboot
        self.nixosModules.nitro-an16-51-hardware
        self.nixosModules.intel-graphics
        self.nixosModules.nvidia-nitro-an16-51
        self.nixosModules.gnome
        self.nixosModules.games
        self.nixosModules.virtualisation

        ({ pkgs, ... }: {
          system.stateVersion = "26.05";

          boot.loader.systemd-boot.enable = true;
          boot.loader.efi.canTouchEfiVariables = false;
          boot.loader.timeout = 0;

          services.tlp.settings = {
            RUNTIME_PM_ENABLE = "01:00.0";
            DISK_DEVICES = "nvme0n1";
          };

          system.autoUpgrade = {
            enable = true;
            flake = "/home/user/dotfiles/nixos";
            flags = [
              "--print-build-logs"
            ];
            dates = "02:00";
            randomizedDelaySec = "45min";
          };

          networking.hostName = "nitro-an16-51";
          networking.networkmanager.enable = true;

          time.timeZone = "Europe/Moscow";

          i18n.defaultLocale = "ru_RU.UTF-8";
          console.font = "latarcyrheb-sun32";

          users.defaultUserShell = pkgs.zsh;
          users.users = {
            user = {
              isNormalUser = true;
              extraGroups = [ "wheel" "libvirtd" ];
              initialPassword = "123";
            };
          };
        })
      ];
    };
  }
