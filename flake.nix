{
  description = "Home Manager configuration of leonardo";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };


  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      hostname = "nixos";
      username = "leonardo";
    in {
      homeConfigurations.${username} = home-manager.lib.homeManagerConfiguration {
        inherit pkgs; 
        modules = [ 
          ./home.nix 
        ];
        extraSpecialArgs = { 

        };
      };

      nixosConfiguration.${hostname} = nixpkgs.lib.nixosSystem {
        inherit pkgs;
        modules = [
          ./configuration.nix
        ];
        specialArgs = {
          inherit inputs;
        };
      };

    };
}
