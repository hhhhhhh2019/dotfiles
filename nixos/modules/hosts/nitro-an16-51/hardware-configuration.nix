{ inputs, self, ... }: {
  flake.nixosModules.nitro-an16-51-hardware =
  { config, lib, pkgs, modulesPath, ... }: {
    imports = [
      (modulesPath + "/installer/scan/not-detected.nix")
      self.nixosModules.linuwu_sense
    ];

    boot.initrd.availableKernelModules = [ "xhci_pci" "thunderbolt" "vmd" "nvme" "usb_storage" "uas" "sd_mod" "rtsx_pci_sdmmc" ];
    boot.initrd.kernelModules = [ ];
    boot.extraModulePackages = [ ];
    boot.kernelModules = [ "kvm-intel" ];
    boot.blacklistedKernelModules = [ ];
    boot.kernelParams = [ ];

    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
    hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

    zramSwap.enable = true;

    services.linuwu_sense.enable = true;

    systemd.services.setup-linuwu-colors = {
      description = "Set initial RGB zones for Linuwu-Sense";
      after = [ "modprobe@linuwu_sense.service" ];
      wantedBy = [ "multi-user.target" ];

      serviceConfig = {
        Type = "oneshot";
        RemainAfterExit = true;
        ExecStart = "${pkgs.bash}/bin/bash -c 'echo 4287f5,4287f5,4287f5,4287f5,100 | tee /sys/module/linuwu_sense/drivers/platform:acer-wmi/acer-wmi/four_zoned_kb/per_zone_mode'";
      };
    };

    fileSystems."/" = {
      device = "/dev/disk/by-label/nixroot";
      fsType = "btrfs";
      options = [ "subvol=/root" ];
    };

    fileSystems."/boot" = {
      device = "/dev/disk/by-label/NIXBOOT";
      fsType = "vfat";
      options = [ "umask=007" ];
    };

    fileSystems."/nix" = {
      device = "/dev/disk/by-label/nixroot";
      fsType = "btrfs";
      options = [ "subvol=/nix" ];
    };

    fileSystems."/swap" = {
      device = "/dev/disk/by-label/nixroot";
      fsType = "btrfs";
      options = [ "subvol=/swap" ];
    };

    fileSystems."/home" = {
      device = "/dev/disk/by-label/nixroot";
      fsType = "btrfs";
      options = [ "subvol=/home" ];
    };

    swapDevices = [{
      device = "/swap/swapfile";
      size = 16*1024; # 16 GiB
      options = [ "discard" ];
    }];

    services.btrfs.autoScrub = {
      enable = true;
      interval = "weekly";
      fileSystems = [ "/" ];
    };

    services.fstrim.enable = true;
  };
}
