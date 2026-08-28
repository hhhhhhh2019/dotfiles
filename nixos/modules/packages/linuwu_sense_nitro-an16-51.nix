{ inputs, self, ... }: let
  linuwu_sense = { stdenv, fetchFromGitHub, kernel, lib, ... }: stdenv.mkDerivation {
    pname = "Linuwu-Sense";
    version = "closed-pull-request";

    src = fetchFromGitHub {
      hash = "sha256-fnxuiE0qaXGvWiafY2Qq8ohEVgRTdrddDSQPASuTJg8=";
      owner = "0x7375646F";
      repo = "Linuwu-Sense";
      rev = "refs/pull/71/head";
    };

    nativeBuildInputs = kernel.moduleBuildDependencies;

    makeFlags = [
      "KERNELRELEASE=${kernel.modDirVersion}"
      "KDIR=${kernel.dev}/lib/modules/${kernel.modDirVersion}/build"
      "KERNEL_DIR=${kernel.dev}/lib/modules/${kernel.modDirVersion}/build"
      "EXTRA_CFLAGS=-Wno-error=implicit-function-declaration"
    ];

    patchPhase = ''
      sed -i 's|/lib/modules.*build|${kernel.dev}/lib/modules/${kernel.modDirVersion}/build|g' Makefile
      #sed -i '55i#include <linux/string.h>' src/linuwu_sense.c
      sed -i 's/strncpy/strscpy/g' src/linuwu_sense.c
    '';

    preInstall = ''
      mkdir -p $out/lib/modules/${kernel.modDirVersion}/extra
    '';

    installPhase = ''
      runHook preInstall

      targetDir="$out/lib/modules/${kernel.modDirVersion}/extra"
      mkdir -p "$targetDir"

      cp src/linuwu_sense.ko "$targetDir/"

      runHook postInstall
    '';

    meta = with lib; {
      description = "Linuwu-Sense driver for Acer Predator/Nitro";
      license = licenses.gpl2Only;
      platforms = platforms.linux;
    };
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
