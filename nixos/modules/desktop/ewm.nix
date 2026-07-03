{ inputs, ... }: {
  flake.nixosModules.ewm = { pkgs, ... }: {
    imports = [
      inputs.ewm.nixosModules.default
    ];

    environment.systemPackages = with pkgs; [
      wl-clipboard
      brightnessctl
    ];

    programs.ewm = {
      enable = true;
      withSkia = true;
      #extraEmacsArgs = "--init-directory /etc/nixos/dotfiles/emacs";
      #emacsPackage = pkgs.emacsWithPackagesFromUsePackage {
      #  package = pkgs.emacs-pgtk;
      #    config = ./dotfiles/emacs/init.el;
      #  extraEmacsPackages = epkgs: [
      #    config.programs.ewm.ewmPackage  # ewm.el + libewm_core.so
      #      epkgs.vterm  # packages with native deps go here
      #  ];
      #};
    };
  };
}
