{ ... }: {
  flake.nixosModules.intel-graphics = { pkgs, ... }: {
    hardware.intel-gpu-tools.enable = true;

    hardware.graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        vpl-gpu-rt
        intel-media-driver
      ];
    };
  };
}
