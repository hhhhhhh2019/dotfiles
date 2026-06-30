{
  flake.nixosModules.gnome = { pkgs, ... }: {
    services.displayManager.gdm.enable = true;
    services.desktopManager.gnome.enable = true;
    services.gnome = {
      games.enable = false;
      core-developer-tools.enable = true;
    };

    qt = {
      enable = true;
      platformTheme = "gnome";
      style = "adwaita-dark";
    };

    services.flatpak.packages = [
      "org.altlinux.Tuner"
      "com.mattjakeman.ExtensionManager"
      "io.github.swordpuffin.rewaita"
    ];

    services.flatpak.overrides.settings = {
      global = {
        Context.filesystems = [
          "xdg-config/gtk-3.0:rw"
          "xdg-config/gtk-4.0:rw"
        ];
      };
    };

    programs.kdeconnect = {
      enable = true;
      package = pkgs.gnomeExtensions.gsconnect;
    };

    environment.systemPackages = with pkgs.gnomeExtensions; [
      just-perfection
      vitals
      appindicator
      user-themes
      caffeine
      shotzy
      clipboard-indicator
      bluetooth-battery-meter
      lock-keys-2
      power-off-options
    ] ++ (with pkgs; [
      zbar
      tesseract
      adw-gtk3
      papirus-icon-theme
      resources
    ]);

    environment.variables = {
      TESSDATA_PREFIX = "${pkgs.tesseract}/share/tessdata";
    };
  };
}
