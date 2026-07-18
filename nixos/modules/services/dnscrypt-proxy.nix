{
  flake.nixosModules.dnscrypt-proxy = {
    services.dnscrypt-proxy = {
      enable = true;
      settings = {
        listen_addresses = [ "127.0.0.1:53" ];
        odoh_servers = true;
        require_dnssec = true;
        http3 = true;
        http3_probe = true;
        # proxy = 'socks5://dnscrypt:dnscrypt@127.0.0.1:9050'
        server_names = ["scaleway-fr" "cloudflare"];
      };
    };

    networking.dhcpcd.extraConfig = "nohook resolv.conf";
    networking.networkmanager.dns = "none";
  };
}
