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
          "webtunnel [2001:db8:d0f2:6cd4:8630:8185:18d2:a5c]:443 5A94C0CDB0ED58681BDAA8FDBC53F5C9E32058F8 url=https://beefstrognoff.com/xRiEjTMRdkc9l7vrlASBmOus ver=0.0.4"
          "webtunnel [2001:db8:dee9:5852:b4dc:7e14:21bd:c99b]:443 8ADF1761FA735FDD763781BB94A16EAB64A1CF6C url=https://app01.oneclickhost.eu/WJSgXJRlNnMStkuLZygVJ7lo ver=0.0.6"
          "webtunnel [2001:db8:61d8:dd06:ee48:5658:1005:8c1a]:443 ED7E43FDFA82588D3E01B713F649C5C00C452B0A url=https://mdapi.ch/api/v1/proxy/U84is7V9U8rB0ZgnWKfs65lmwsvprN9x ver=0.0.5"
          "webtunnel [2001:db8:b25f:7b5c:ea:7689:d15e:3389]:443 669F835F5358D33A79DDDD559A3A167B104FF3BC url=https://dsl.one.pl/X7yJZdFkZTGdQkMMclV4qdVz ver=0.0.5"
        ];
      };
    };
  };
}
