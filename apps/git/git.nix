{ config, pkgs, ... }:

{
  home.packages = [ pkgs.git ];

  programs.git = {
    enable = true;
    userName = "StevenBuglione";
    userEmail = "stevenbuglione1@gmail.com";
    extraConfig = {
      gpg = {
        format = "ssh";  # Set GPG format to SSH
      };
      "gpg \"ssh\"" = {
        program = "/opt/1Password/op-ssh-sign";  # Corrected path for 1Password's SSH signing program
      };
      commit = {
        gpgsign = true;  # Enable GPG signing for commits
      };
      user = {
        signingKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIADXEW0ESKUfvgzAYIuHH/Rehcvhm8j4op7VlpLClfvC";
      };
    };
  };
}