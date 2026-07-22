{ inputs, ... }: {
  flake.nixosModules.secureboot = { pkgs, lib, ... }: {
    imports = [
      inputs.lanzaboote.nixosModules.lanzaboote
    ];

    environment.systemPackages = with pkgs; [
      sbctl
    ];

    boot.loader.systemd-boot.enable = lib.mkForce false;
    boot.lanzaboote = {
      enable = true;
      pkiBundle = "/var/lib/sbctl";
      autoGenerateKeys.enable = true;
      autoEnrollKeys = {
        enable = true;
        includeMicrosoftKeys = true;
      };
      measuredBoot = {
        enable = false;
        pcrs = [ 0 4 7 ];
      };
      configurationLimit = 8;
    };

    #systemd.services.systemd-tpm2-setup.enable = false;
  };
}
