{
  flake.nixosModules.music = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      mpd
      mpd-mpris
      mpc
      ncmpcpp
    ];
  };
}
