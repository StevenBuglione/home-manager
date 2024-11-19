{ config, pkgs, ... }:

{
  home.username = "sbuglione";
  home.homeDirectory = "/home/sbuglione/distro/fedora/fedora-41-main/sbuglione";
  home.stateVersion = "24.05"; # Please read the comment before changing.
  nixpkgs.config.allowUnfree = true;


  home.packages = [
    pkgs.neovim
    pkgs.curl
    pkgs.xclip
    pkgs.fastfetch
    pkgs.bash-completion
    pkgs.tree
    pkgs.fontconfig
    pkgs.starship
    pkgs.zoxide
    pkgs.fzf
    pkgs.multitail
    pkgs.bat
    pkgs.trash-cli
    pkgs.ripgrep
    pkgs.helm
    pkgs.kubectl
    pkgs.ansible
    pkgs.go-task
    pkgs.just
  ];

  home.file = {
    ".config/fastfetch/config.jsonc".source = ./apps/fastfetch/config.jsonc;
    ".config/starship.toml".source = ./apps/starship/starship.toml;
    ".config/kitty/kitty.conf".source = ./apps/kitty/kitty.conf;
    ".local/share/fonts/JetbrainsMono".source = ./apps/fonts/JetbrainsMono;
    ".zshrc".source = ./apps/zsh/.zshrc;
    ".oh-my-zsh/custom/plugins/zsh-autosuggestions".source = ./apps/zsh/plugins/zsh-autosuggestions;
    ".oh-my-zsh/custom/plugins/zsh-syntax-highlighting".source = ./apps/zsh/plugins/zsh-syntax-highlighting;
    ".oh-my-zsh/custom/plugins/zsh-bat".source = ./apps/zsh/plugins/zsh-bat;
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/sbuglione/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };



  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
