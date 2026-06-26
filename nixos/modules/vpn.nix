{
  flake.nixosModules.vpn = { config, pkgs, lib, ... }: let
    vpns = config.services.vpns;
  in {
    options.services.vpns = lib.mkOption {
      type = lib.types.listOf (lib.types.submodule {
        options = {
          name = lib.mkOption { type = lib.types.str; description = "Имя"; };
          iface = lib.mkOption { type = lib.types.str; description = "Имя интерфейса (до 15 символов)"; };
          url = lib.mkOption { type = lib.types.str; description = "URL прокси (socks5://... или http://...)"; };
        };
      });
      default = [];
      description = "Список прокси-серверов";
    };

    config = lib.mkIf (vpns != []) {
      environment.systemPackages = with pkgs; [ tun2proxy networkmanager ];

      #networking.firewall.checkReversePath = "loose";
      networking.networkmanager.enable = true;

      #systemd.services = {
      #  init-nm-proxy-profiles = {
      #    description = "Automatically ensure NetworkManager profiles for proxies exist";
      #    after = [ "network.target" "NetworkManager.service" ];
      #    wants = [ "NetworkManager.service" ];
      #    wantedBy = [ "default.target" ];
      #    script = lib.concatMapStringsSep "\n" (proxy: ''
      #      if ! ${pkgs.networkmanager}/bin/nmcli connection show "${proxy.name}" >/dev/null 2>&1; then
      #        ${pkgs.networkmanager}/bin/nmcli connection add type tun con-name "${proxy.name}" ifname "${proxy.iface}" autoconnect no
      #      fi
      #    '') vpns;
      #    serviceConfig = { Type = "oneshot"; RemainAfterExit = true; };
      #  };
      #} // lib.listToAttrs (map (proxy: {
      #  name = "tun2socks-${proxy.iface}";
      #  value = {
      #    description = "Tun2Socks wrapper for ${proxy.name}";
      #    after = [ "network.target" ];
      #    wantedBy = [ "multi-user.target" ];
      #    serviceConfig = {
      #      ExecStart = "${pkgs.tun2socks}/bin/tun2socks -device ${proxy.iface} -proxy ${proxy.url}";
      #      Restart = "always";
      #      User = "root";
      #    };
      #  };
      #}) vpns);
    };
  };
}
