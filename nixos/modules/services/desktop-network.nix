{
  flake.nixosModules.desktop-network = {
    networking.firewall = {
      enable = true;
      allowedTCPPortRanges = [
        { from = 1024; to = 65535; }
      ];
      allowedUDPPortRanges = [
        { from = 1024; to = 65535; }
      ];
    };

    services.dnscrypt-proxy = {
      enable = true;
      settings = {
        cache = true;
        listen_addresses = [ "[::]:5354" ];
        #dnscrypt_servers = false;
        doh_servers = true;
        odoh_servers = false;
        require_dnssec = true;
        require_nolog = true;
        require_nofilter = true;
        http3 = false;
        http3_probe = true;
        # proxy = 'socks5://dnscrypt:dnscrypt@127.0.0.1:9050'
        server_names = [ ];

        sources = {
          public-resolvers = {
            urls = ["https://raw.githubusercontent.com/DNSCrypt/dnscrypt-resolvers/master/v3/public-resolvers.md" "https://download.dnscrypt.info/resolvers-list/v3/public-resolvers.md"];
            cache_file = "/var/lib/dnscrypt-proxy/public-resolvers.md";
            minisign_key = "RWQf6LRCGA9i53mlYecO4IzT51TGPpvWucNSCh1CBM0QTaLn73Y7GFO3";
            refresh_delay = 72;
            prefix = "";
          };

          relays = {
            urls = ["https://raw.githubusercontent.com/DNSCrypt/dnscrypt-resolvers/master/v3/relays.md" "https://download.dnscrypt.info/resolvers-list/v3/relays.md" "https://cdn.jsdelivr.net/gh/DNSCrypt/dnscrypt-resolvers@master/v3/relays.md"];
            minisign_key = "RWQf6LRCGA9i53mlYecO4IzT51TGPpvWucNSCh1CBM0QTaLn73Y7GFO3";
            cache_file = "/var/lib/dnscrypt-proxy/relays.md";
          };
        };

        anonymized_dns = {
          routes = [
            {
              server_name = "*";
              via = [ "*" ];
            }
          ];
        };
      };
    };
    
    services.resolved = {
      enable = true;
      settings.Resolve = {
        DNS = [ "127.0.0.1:5354" "[::]:5354" ];
        Domains = [ "~." ];
        DNSSEC = "no";
        FallbackDNS = null;
        LLMNR = "no";
        MulticastDNS = "no";
      };
    };

    services.avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
      publish = {
        enable = true;
        addresses = true;
        workstation = true;
        userServices = true;
      };
    };

    networking = {
      resolvconf.enable = false;
      networkmanager.dns = "systemd-resolved";
    };
  };
}
