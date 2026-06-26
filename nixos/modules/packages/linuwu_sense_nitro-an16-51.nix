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
  ];

# Если Makefile игнорирует флаги, принудительно патчим его самым грубым способом:
  patchPhase = ''
    sed -i 's|/lib/modules.*build|${kernel.dev}/lib/modules/${kernel.modDirVersion}/build|g' Makefile
    '';

  preInstall = ''
    mkdir -p $out/lib/modules/${kernel.modDirVersion}/extra
    '';

# Пишем установку вручную, чтобы обойти sudo и depmod в Makefile
  installPhase = ''
    runHook preInstall

# Создаем структуру директорий для модулей ядра в Nix Store
    targetDir="$out/lib/modules/${kernel.modDirVersion}/extra"
    mkdir -p "$targetDir"

# Копируем скомпилированный модуль (путь src/ может зависеть от версии драйвера)
# Если файл лежит в корне, уберите src/
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
