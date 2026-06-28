{ inputs, self, ... }: {
  flake.nixosModules.basic-environment = { pkgs, ... }: {
    boot.kernelPackages = pkgs.linuxPackages_latest;

    programs.zsh = {
      enable = true;
      syntaxHighlighting.enable = true;
      promptInit = "";
      interactiveShellInit = ''
        source ${pkgs.grml-zsh-config}/etc/zsh/zshrc
      '';
    };

    programs.vim = {
      enable = true;
      defaultEditor = true;
      package = (pkgs.vim.override {}).customize {
        name = "vim";
        vimrcConfig.customRC = ''
          syntax on
          set autoindent
          set smartindent
          set smartcase
          set mouse=a
          set expandtab
          set tabstop=2
          set shiftwidth=2
          filetype plugin indent on
        '';
      };
    };

    programs.tmux = {
      enable = true;
    };

    programs.git = {
      enable = true;
    };

    programs.direnv = {
      enable = true;
    };

    programs.nix-ld.enable = true;
  };
}
