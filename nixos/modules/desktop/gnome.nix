{ self, ... }: {
  flake.nixosModules.gnome = { pkgs, ... }: {
    imports = [
      self.nixosModules.spelling
    ];

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
      libreoffice

      hunspell
      hunspellDicts.ru_RU
      hunspellDicts.en-us-large

      zbar
      tesseract
      adw-gtk3
      papirus-icon-theme
      resources
      ptyxis
      gnome-tweaks
      geary

      unrar

      (pkgs.stdenv.mkDerivation {
        pname = "gnome-shell-extension-gradia-capture";
        version = "master";

        src = pkgs.fetchFromGitHub {
          owner = "AlexanderVanhee";
          repo = "gradia-capture";
          rev = "f70a2127d0a9acc3c9d4d8198361fc9f4e14818f";
          sha256 = "sha256-XruZoUTbDT/qOPmFj5/CyvQfhH6Tg0IqJ4JPVMiu5zQ=";
        };

        nativeBuildInputs = with pkgs; [
          glib
          gettext
        ];

        buildPhase = ''
          runHook preBuild
          if [ -d schemas ]; then
            glib-compile-schemas schemas/
          fi
          runHook postBuild
        '';

        installPhase = ''
          mkdir -p $out/share/gnome-shell/extensions/gradia-capture@alexandervanhee.be
          cp -r * $out/share/gnome-shell/extensions/gradia-capture@alexandervanhee.be/
          runHook postInstall
        '';
      })
    ]);

    environment.gnome.excludePackages = with pkgs; [
      gnome-console
    ];

    environment.variables = {
      TESSDATA_PREFIX = "${pkgs.tesseract}/share/tessdata";
    };
  };
}
