{
  description = "Multi-machine Home Manager config with flakes";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    home-manager.url = "github:nix-community/home-manager/release-23.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, home-manager, ... }: {
    homeConfigurations = {

      # Linux system (Azure)
      azureuser = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          system = "x86_64-linux";
          config.allowUnfree = true;
        };
        modules = [ ./home.nix ];
        # home.username = "azureuser";
        # home.homeDirectory = "/home/azureuser";
      };

      # Macbook (M Series)
      chamalgomes = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          system = "aarch64-darwin";
          config.allowUnfree = true;
        };
        modules = [ ./home.nix ];
        home.username = "chamalgomes";
        home.homeDirectory = "/Users/chamalgomes";
      };
    };
  };
}
