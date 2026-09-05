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
        ClientTransportPlugin = [
          "webtunnel exec ${pkgs.webtunnel}/bin/client"
          "snowflake exec ${pkgs.snowflake}/bin/client"
        ];
        Bridge = [
          "snowflake 192.0.2.3:80 2B280B23E1107BB62ABFC40DDCC8824814F80A72 fingerprint=2B280B23E1107BB62ABFC40DDCC8824814F80A72 url=https://1098762253.rsc.cdn77.org/ fronts=www.cdn77.com,www.phpmyadmin.net ice=stun:stun.antisip.com:3478,stun:stun.epygi.com:3478,stun:stun.uls.co.za:3478,stun:stun.voipgate.com:3478,stun:stun.mixvoip.com:3478,stun:stun.nextcloud.com:3478,stun:stun.bethesda.net:3478,stun:stun.nextcloud.com:443 utls-imitate=hellorandomizedalpn"
          "snowflake 192.0.2.4:80 8838024498816A039FCBBAB14E6F40A0843051FA fingerprint=8838024498816A039FCBBAB14E6F40A0843051FA url=https://1098762253.rsc.cdn77.org/ fronts=www.cdn77.com,www.phpmyadmin.net ice=stun:stun.antisip.com:3478,stun:stun.epygi.com:3478,stun:stun.uls.co.za:3478,stun:stun.voipgate.com:3478,stun:stun.mixvoip.com:3478,stun:stun.nextcloud.com:3478,stun:stun.bethesda.net:3478,stun:stun.nextcloud.com:443 utls-imitate=hellorandomizedalpn"
          #"webtunnel [2001:db8:d0f2:6cd4:8630:8185:18d2:a5c]:443 5A94C0CDB0ED58681BDAA8FDBC53F5C9E32058F8 url=https://beefstrognoff.com/xRiEjTMRdkc9l7vrlASBmOus ver=0.0.4"
          #"webtunnel [2001:db8:dee9:5852:b4dc:7e14:21bd:c99b]:443 8ADF1761FA735FDD763781BB94A16EAB64A1CF6C url=https://app01.oneclickhost.eu/WJSgXJRlNnMStkuLZygVJ7lo ver=0.0.6"
          #"webtunnel [2001:db8:61d8:dd06:ee48:5658:1005:8c1a]:443 ED7E43FDFA82588D3E01B713F649C5C00C452B0A url=https://mdapi.ch/api/v1/proxy/U84is7V9U8rB0ZgnWKfs65lmwsvprN9x ver=0.0.5"
          #"webtunnel [2001:db8:b25f:7b5c:ea:7689:d15e:3389]:443 669F835F5358D33A79DDDD559A3A167B104FF3BC url=https://dsl.one.pl/X7yJZdFkZTGdQkMMclV4qdVz ver=0.0.5"
        ];
      };
    };
  };
}
