{
  flake.nixosModules.desktop-network = {
    services.dnscrypt-proxy = {
      enable = true;
      settings = {
        listen_addresses = [ "[::]:5354" ];
        doh_servers = true;
        odoh_servers = false;
        require_dnssec = true;
        require_nolog = true;
        require_nofilter = true;
        http3 = true;
        http3_probe = false;
        # proxy = 'socks5://dnscrypt:dnscrypt@127.0.0.1:9050'
        server_names = ["scaleway-fr" "google" "cloudflare"];
      };
    };
    
    services.resolved = {
      enable = true;
      settings.Resolve = {
        DNS = [ "127.0.0.1:5354" "[::]:5354" ];
        Domains = [ "~." ];
        DNSSEC = "yes";
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
