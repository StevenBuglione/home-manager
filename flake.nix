{
  description = "Home Manager configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

      # Retrieve the username from the USER environment variable or default to "defaultUser"
      username = let
        u = builtins.getEnv "USER";
      in if u == "" then "defaultUser" else u;
    in {
      homeConfigurations."${username}" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {
          inherit system;
          allowUnfree = true;
          inherit username;
        };

        modules = [ ./home.nix ];
      };
    };
}
