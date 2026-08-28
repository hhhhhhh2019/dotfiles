{
  flake.nixosModules.i2pd = {
    #services.vpns = [ {
    #  name = "i2p";
    #  iface = "socks-i2pd";
    #  url = "socks5://localhost:4447";
    #} ];

    services.i2pd = {
      enable = true;
      settings = {
        ntcp = false;
        ntcp2 = {
          enabled = true;
          published = false;
        };
        ssu = false;
        ssu2 = {
          enabled = true;
          published = false;
        };
        bob.enabled = false; # 2827
        sam.enabled = true; # 7656
        #websocket.enabled = false; # 7666
        http.enabled = true;
        httpproxy = {
          enabled = true; # 4444
          outproxy = "http://outproxy.acetone.i2p:3128";
          outbound.length = 1;
          inbound.length = 1;
        };
        socksproxy = {
          enabled = true; # 4447
          "outproxy.enabled" = true;
          "outproxy" = "127.0.0.1";
          outproxyport = 4500;
        };
      };
      clientTunnels = {
        socks-outproxy-tcp = {
          type = "client";
          address = "127.0.0.1";
          port = 4500;
          keys = "transient-outproxy";
          destination = "outproxy.acetone.i2p";
          destinationport = 1080;
          inbound.length = 1;
          outbound.length = 1;
          inbound.lengthVariance = 1;
          outbound.lengthVariance = 1;
        };

        socks-outproxy-udp = {
          type = "udpclient";
          address = "127.0.0.1";
          port = 4500;
          keys = "transient-outproxy";
          destination = "outproxy.acetone.i2p";
          destinationPort = 1080;
        };
      };
    };
  };
}
