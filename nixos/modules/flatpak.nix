{ inputs, ... }: {
  flake.nixosModules.flatpak = { pkgs, ... }: {
    imports = [
      inputs.nix-flatpak.nixosModules.nix-flatpak
    ];

    services.flatpak.enable = true;

    services.flatpak.remotes = [{
      name = "flathub"; location = "https://flathub.org/repo/flathub.flatpakrepo";
    }];

    services.flatpak.packages = [
      "app.zen_browser.zen"
      "com.github.flxzt.rnote"
      "org.telegram.desktop"
    ];

    #systemd.user.services.flatpak-user-setup = {
    #  wantedBy = [ "default.target" ];
    #  path = [ pkgs.flatpak ];
    #  script = ''
    #    flatpak remote-add --if-not-exists --user flathub https://flathub.org/repo/flathub.flatpakrepo
    #  '';
    #};
  };
}
