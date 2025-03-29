{ lib, pkgs, config, ... }:
let
  unstable = import <nixpkgs-unstable> { config = {}; };
in
{
  programs.firefox = {
    enable = true;

    
    profiles = {
      leonardo = {
        #IsRelative=1
        #path = "/home/leonardo/.mozilla/firefox/v9f9bcoa.default";
        isDefault = true;
      };

      woland = {
        id = 1;
        name = "woland";
      };
    };

  };
}
