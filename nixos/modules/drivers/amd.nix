{
  flake.nixosModules.amd-graphics = { pkgs, ... }: {
    hardware.graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        rocmPackages.clr.icd
        #clinfo
        corectrl
      ];
    };

    hardware.amdgpu = {
      opencl.enable = true;
    };

    systemd.tmpfiles.rules = let
      rocmEnv = pkgs.symlinkJoin {
        name = "rocm-combined";
        paths = with pkgs.rocmPackages; [
          rocblas
          hipblas
          clr
        ];
      };
    in [ "L+    /opt/rocm   -    -    -     -    ${rocmEnv}" ];

    nixpkgs.config.rocmSupport = true;
  };
}
