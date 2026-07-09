{ inputs, self, ... }: {
  flake.nixosModules.pc-hardware =
    { config, lib, pkgs, modulesPath, ... }: {
      imports = [
        (modulesPath + "/installer/scan/not-detected.nix")
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

      fileSystems."/" = {
        device = "/dev/disk/by-label/nixroot";
        fsType = "btrfs";
        options = [ "subvol=/root" ];
      };

      fileSystems."/efi" = {
        device = "/dev/disk/by-uuid/2607-4097";
        fsType = "vfat";
        options = [ "fmask=0077" "dmask=0077" ];
      };

      fileSystems."/boot" = {
        device = "/dev/disk/by-label/NIXBOOT";
        fsType = "vfat";
        options = [ "fmask=0077" "dmask=0077" ];
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

      swapDevices = [];

      services.btrfs.autoScrub = {
        enable = true;
        interval = "weekly";
        fileSystems = [ "/" ];
      };

      services.fstrim.enable = true;
    };
  }
