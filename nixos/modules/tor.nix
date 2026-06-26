{
  flake.nixosModules.tor = { pkgs, ... }: {
    services.tor = {
      enable = true;
      enableGeoIP = false;
      torsocks.enable = true;
      client = {
        enable = true;
      };
      controlSocket.enable = true;
      openFirewall = true;
      settings = {
        #SOCKSPort = [ 9050 ];
        UseBridges = true;
        ClientTransportPlugin = "webtunnel exec ${pkgs.webtunnel}/bin/client";
        Bridge = [
          "webtunnel [2001:db8:582a:3e92:df7a:c770:19f7:64e0]:443 67313AEAF0319B172CD12EAEAFCD6F29C12171AB url=https://tor-bridge.scaledra.com/Cgb29jTFCUBdTGEz8BDkQFrn ver=0.0.4"
          "webtunnel [2001:db8:bce8:edf7:7b33:480b:fde5:4840]:443 A417275864EA76F47CEAD4071273D82917283A12 url=https://www3.ruhnama.net/Ly4uulgoy2LWmMX3fk007Gme ver=0.0.3"
          "webtunnel [2001:db8:e65a:afaf:7443:b5a5:f71d:ca4]:443 6FE31638D6084EDA6D94FADC99B0EDD109D6AE3A url=https://eu.g3wip.uk/7ePavP0vnTTelEJWeJ4NwpGE ver=0.0.1"
          "webtunnel [2001:db8:603c:2434:873c:4d58:9fd0:91e0]:443 56626E4B996EB1C9F4C0B573888E8EE3C4E28472 url=https://kriptohomyaki.org/4USXwPrEoemgJOXPmgjxPOAkQa1UG7To ver=0.0.3"
        ];
      };
    };
  };
}
