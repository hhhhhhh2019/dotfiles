{ inputs, self, ... }: {
  flake.nixosConfigurations.pc = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.default-environment
      self.nixosModules.pc-hardware
      self.nixosModules.intel-graphics
      self.nixosModules.amd-graphics
      self.nixosModules.plasma
      self.nixosModules.games
      self.nixosModules.virtualisation
      self.nixosModules.edl
      self.nixosModules.dnscrypt-proxy

      ({ pkgs, ... }: {
        system.stateVersion = "26.05";

        systemd.services.nix-daemon.environment = {
          http_proxy = "socks5h://127.0.0.1:9050";
          https_proxy = "socks5h://127.0.0.1:9050";
          socks_proxy = "socks5://127.0.0.1:9050";
        };

        boot.loader.systemd-boot.enable = true;
        boot.loader.efi.canTouchEfiVariables = false;
        boot.loader.efi.efiSysMountPoint = "/efi";
        boot.loader.systemd-boot.xbootldrMountPoint = "/boot";
        boot.loader.timeout = 5;

        services.displayManager.plasma-login-manager.settings = {
          Autologin = {
            User = "user";
            Session = "plasma.desktop";
          };
        };

        services.tlp.settings = {
        };

        system.autoUpgrade.enable = false;

        networking.hostName = "pc";
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
