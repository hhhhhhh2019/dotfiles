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
          "118.241.190.171:45883 3563137EC7EDD0D86B9D3109BA63D933FAA22958"
          "185.177.207.197:18197 382AD67F3914B9482AB77540C432F074CDE7C782"

          #"webtunnel [2001:db8:1640:379c:ad30:db5f:bff5:37d0]:443 AF8F7548C886D6F53A652411DBB71D089517085A url=https://app05.oneclickhost.eu/alpfZGTB9FckCgOkOOA0OHlh ver=0.0.5"
          #"webtunnel [2001:db8:1ecc:edad:a642:10d8:adc1:c886]:443 C2176476CDD39DFAB550BBC94E1DF3980398E5FC url=https://mstdn.plus/Lohguu6eequaethu ver=0.0.2"
          #"webtunnel [2001:db8:50a9:c546:36be:96ad:4cd1:cfff]:443 D20CE64A82CF6E6DB6F4F95C1F8FA81B06C10888 url=https://cdn-35.triplebit.dev/iethae6ahvoo1ieV ver=0.0.2"
          #"webtunnel [2001:db8:d4f6:87b2:888f:72a3:f117:eaf4]:443 8E860A30788AA17A84C0AFB8F111BAB0D5504FE0 url=https://flabrance.tech/aTzB6XNVkeh2XqT9XQ0RHmHw ver=0.0.2"
        ];
      };
    };
  };
}
