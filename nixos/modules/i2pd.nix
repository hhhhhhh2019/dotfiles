{
  flake.nixosModules.i2pd = {
    #services.vpns = [ {
    #  name = "i2p";
    #  iface = "socks-i2pd";
    #  url = "socks5://localhost:4447";
    #} ];

    services.i2pd = {
      enable = true;
      address = "127.0.0.1";
      ntcp = false;
      ntcp2 = {
        enable = true;
        published = false;
      };
      ssu = false;
      ssu2 = {
        enable = true;
        published = false;
      };
      inTunnels = {

      };
      outTunnels = {
        socks-outproxy-tcp = {
          enable = true;
          type = "client";
          address = "127.0.0.1";
          port = 4500;
          keys = "transient-outproxy";
          destination = "outproxy.acetone.i2p";
          destinationPort = 1080;
          inbound = {
            length = 1;
            quantity = 1;
          };
          outbound = {
            length = 1;
            quantity = 1;
          };
        };

        socks-outproxy-udp = {
          enable = true;
          type = "udpclient";
          address = "127.0.0.1";
          port = 4500;
          keys = "transient-outproxy";
          destination = "outproxy.acetone.i2p";
          destinationPort = 1080;
        };
      };
      proto = {
        http.enable = true;
        httpProxy = {
          enable = true; # 4444
          outproxy = "http://outproxy.acetone.i2p:3128";
          outbound.length = 1;
          inbound.length = 1;
        };
        socksProxy = {
          enable = true; # 4447
          outproxyEnable = true;
          outproxy = "127.0.0.1";
          outproxyPort = 4500;
        };
        bob.enable = false; # 2827
        sam.enable = true; # 7656
      };
      websocket.enable = false; # 7666
    };
  };
}
