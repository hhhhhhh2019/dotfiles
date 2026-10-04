{ inputs, ... }: let
  linuwu_sense = { stdenv, kernel, lib, ... }: stdenv.mkDerivation {
    pname = "linuwu-sense";
    version = "git-${inputs.linuwu-sense.shortRev or "dirty"}";
    src = inputs.linuwu-sense;

    nativeBuildInputs = kernel.moduleBuildDependencies;

    patches = [ ./an16_51.patch ];

    buildPhase = ''
      make -C ${kernel.dev}/lib/modules/${kernel.modDirVersion}/build M=$PWD modules
    '';

    installPhase = ''
      runHook preInstall
      install -Dm444 src/linuwu_sense.ko $out/lib/modules/${kernel.modDirVersion}/extra/linuwu_sense.ko
      runHook postInstall
    '';
  };
in {
  flake.nixosModules.linuwu_sense = { lib, config, pkgs, ... }: {
    options.services.linuwu_sense.enable = lib.mkEnableOption "Enable linuwu-sense";

    config = lib.mkIf config.services.linuwu_sense.enable {
      boot.extraModulePackages = [ (config.boot.kernelPackages.callPackage linuwu_sense {}) ];
      boot.kernelModules = [ "linuwu_sense" ];
      boot.blacklistedKernelModules = [ "acer_wmi" ];
    };
  };
}
