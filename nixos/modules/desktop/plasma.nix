{
  flake.nixosModules.plasma = { pkgs, ... }: {
    services.displayManager.plasma-login-manager.enable = true;
    services.desktopManager.plasma6.enable = true;

    programs.kdeconnect.enable = true;
    services.accounts-daemon.enable = true;
    security.pam.services.plasma-login-manager.kwallet.enable = true;
    programs.partition-manager.enable = true;

    services.flatpak.overrides.settings = {
      global = {
        Context.filesystems = [
          "xdg-config/gtk-3.0:rw"
          "xdg-config/gtk-4.0:rw"
        ];
      };
    };

    environment.systemPackages = with pkgs; [
      (kdePackages.spectacle.override {
       tesseractLanguages = [ "all" ];
      })

      hunspell
      hunspellDicts.ru_RU
      hunspellDicts.en-us-large

      kdePackages.plasma-thunderbolt
      kdePackages.plasma-firewall
      kdePackages.wallpaper-engine-plugin
      kdiff3
      kdePackages.ksystemlog
      kdePackages.kcharselect
      kdePackages.kcolorchooser
      kdePackages.kcolorpicker
      hardinfo2
      wl-clipboard
      vlc

      kdePackages.kio-fuse
      kdePackages.kio-admin
      kdePackages.kio-extras
      kdePackages.kio-gdrive
      kdePackages.kio-zeroconf
      kdePackages.audiocd-kio
    ];
  };
}
