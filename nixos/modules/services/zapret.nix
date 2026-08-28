{
  flake.nixosModules.zapret = {
    services.zapret = {
      enable = true;
      params = [
        "--dpi-desync=fake"
        "--dpi-desync-ttl=4"
      ];
      whitelist = [
        "akamaihd.net"
        "steamusercontent.com"
        "x.com"
        "abs.twimg.com"
      ];
    };
  };
}
