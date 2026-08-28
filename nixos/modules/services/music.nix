{
  flake.nixosModules.music = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      mpd
      mpd-mpris
      mpc
      ncmpcpp
    ];

    systemd.user.services.mpd-mpris = {
      description = "mpd-mpris service";
      wantedBy = [ "default.target" ];
      serviceConfig = {
        After = [ "mpd.service" ];
        Requires = [ "mpd.service" ];
        ExecStart = "${pkgs.mpd-mpris}/bin/mpd-mpris";
        BusName = "org.mpris.MediaPlayer2.mpd";
        TimeoutStartSec = "2s";
      };
    };
  };
}
