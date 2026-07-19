{ inputs, ... }: {
  flake.nixosModules.games = { lib, pkgs, ... }: {
    boot.kernelModules = [ "ntsync" ];

    environment.systemPackages = with pkgs; [
      mangohud
      gamescope-wsi
      #inputs.portproton-nixos.packages.${pkgs.stdenv.hostPlatform.system}.portproton
      #(pkgs.callPackage "${inputs.portproton-nixos}/pkgs/portproton/package.nix" { })
      file
      jq
    ];

    hardware.steam-hardware.enable = true;
    programs.gamemode = {
      enable = true;
      enableRenice = true;
    };
    programs.gamescope = {
      enable = true;
      enableWsi = true;
      capSysNice = true;
    };
    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
      extest.enable = true;
    };
  };
}
