{
  flake.nixosModules.spelling = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      hunspell
      hunspellDicts.ru_RU
      hunspellDicts.en_US

      enchant
    ];

    environment.etc."enchant/enchant.ordering".text = ''
      *:hunspell
    '';

    environment.sessionVariables = {
      DICPATH = "/run/current-system/sw/share/hunspell";
    };
  };
}
