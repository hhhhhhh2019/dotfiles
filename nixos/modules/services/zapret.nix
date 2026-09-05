{
  flake.nixosModules.zapret = {
    services.zapret2 = {
      enable = true;
      profiles = {
        https = {
          parameters = [
            "--filter-tcp=443"
            "--payload=tls_client_hello"
            "--lua-desync=luaexec:code=desync.patmod=tls_mod(fake_default_tls,'rnd,dupsid,padencap',desync.reasm_data)"
            "--lua-desync=multisplit:pos=10:seqovl=#patmod:seqovl_pattern=patmod"
          ];

          hosts.include = [
            "x.com"
            "abs.twimg.com"
            "twimg.twitter.map.fastly.net"
            "akamaihd.net"
            "steamusercontent.com"
          ];
        };

        discord = {
          parameters = [
            "--filter-tcp=443"
            "--payload=tls_client_hello"
            "--lua-desync=hostfakesplit:disorder_after:tcp_flags_set=SYN:repeats=1"
          ];

          hosts.include = [
            "discord.com"
            "discordapp.com"
            "updates.discord.com"
          ];
        };
      };
    };
  };
}
