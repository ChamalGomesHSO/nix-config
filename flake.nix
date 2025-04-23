{
  description = "Home Manager config with flakes";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    home-manager.url = "github:nix-community/home-manager/release-23.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux"; # Or aarch64-darwin if you're on M1 Mac etc.
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in {
      homeConfigurations.azureuser = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [
          ./home-azure.nix
        ];
      };
    };
}
