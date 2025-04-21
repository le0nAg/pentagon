{
  description = "NixOS configuration with Home Manager";

  inputs = {
    # NixOS latest stable 24.11
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    
    # Unstable channel for packages referenced in home.nix
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    
    # Home Manager matching the NixOS version
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, ... }@inputs:
    let
      system = "x86_64-linux"; # Modifica se utilizzi un'architettura diversa
      username = "leonardo"; # Username dal tuo home.nix
      
      # Configurazione nixpkgs
      pkgs = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
          android_sdk.accept_license = true;
        };
      };
      
      # Configurazione unstable per i pacchetti unstable
      unstable = import nixpkgs-unstable {
        inherit system;
        config = {
          allowUnfree = true;
          android_sdk.accept_license = true;
        };
      };
      
    in {
      # NixOS configuration
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs unstable; };
        modules = [
          ./nixos/configuration.nix
          
          # Integrazione home-manager in NixOS
          home-manager.nixosModules.home-manager {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = { 
                inherit pkgs unstable;
              };
              users.${username} =  ./home-manager/home.nix;

              backupFileExtension = "bk";
            };
          }
        ];
      };
    };
}