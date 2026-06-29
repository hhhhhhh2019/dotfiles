{
  flake.nixosModules.steam = {
    hardware.steam-hardware.enable = true;
    programs.gamemode = {
      enable = true;
      enableRenice = true;
    };
    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
      extest.enable = true;
    };
  };
}
