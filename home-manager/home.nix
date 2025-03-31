{ config, pkgs, ... }:
let
  fhsEnv = pkgs.buildFHSUserEnv {
    name = "fhs-java-env";
    targetPkgs = pkgs: [
      pkgs.openjdk
      pkgs.jetbrains.idea-ultimate
    ];
  };
  python = pkgs.python3;
  unstable = import <nixpkgs-unstable> { config = {}; };
in
{
  
  imports = [
    ides/vscode.nix
    ides/nvim.nix
    ides/eclipse.nix
    ides/jetbrains.nix
    ides/android_studio.nix
    #ricing/hyprland.nix
    
    browsers/firefox.nix
    browsers/tor.nix
    browsers/brave.nix
    browsers/librewolf.nix
    browsers/mullvad.nix
    browsers/chrome.nix
    browsers/tor.nix

    meetings/meetings.nix

    programming/git.nix
  ];
  
  home.username = "leonardo";
  home.homeDirectory = "/home/leonardo";

  home.stateVersion = "24.11";
  
  nixpkgs = {
    config = {
      allowUnfree = true;
      android_sdk.accept_license = true;
    };
  };

  programs.bash = {
    enable = true;
    shellAliases = {
      hacking = "nix-shell ~/hacking/shell.nix";
    };
  };

  
  home.packages = with pkgs; [
    
    patchelf
    glib
    openjfx
    gtk3
    file
    ngrok
    
    gdb

    android-tools

    cmake
    gnumake
    meson

    tcpdump

    jekyll

    globalprotect-openconnect
    
    uv

    gramps

    ruby
    (python.withPackages (ps:
      with ps; [  
          jupyter
          flask
          requests
          html5lib
          beautifulsoup4
          pycryptodome
          pwntools
        ]
      )
    )
    #jupyter-all

    go
    flutter
    unstable.simplex-chat-desktop
    unstable.zotero
    gimp

    wp-cli

    arduino-ide
    #fw shits
    fw-ectool

    #bios shits
    flashrom
    minicom

    #utils 
    xz
    gh
      
    #browsers
    # tor-browser
    # brave
    # google-chrome
    # librewolf
    # mullvad-browser
    # floorp    

    #java env
    fhsEnv

    inkscape

    neofetch
    
    #blockchain & wallets
    electrum

    #hacking shits
    binwalk
    wireshark
    dig
    gobuster
    dirbuster
    seclists
    ffuf
    dirb
    proxychains
    exif
    exiftool
    steghide
    burpsuite
    zap
    ghidra
    rizin
    # pwntools
    
    #proxies and vpns
    #proxychains-ng
    openvpn
    #mullvad
    #mullvad-vpn

    
      #browser
      i2p
      i2pd

    #networking shits
    traceroute
    inetutils

    frr
    zoxide #TODO
    
    xwayland
    
    #things of elethronics
    #kicad

    #things for programming client
	  dbeaver-bin	
    postman
    mongodb-compass
    mongosh

    gephi #graph analysis
    
    #self explanatory
	  libreoffice-qt

    #appunti 
    #notion
    #notion-app-enhanced
    obsidian

    #OTP/passw managers
    keepassxc

    #system monitoring and issue investingation
    glxinfo
  ];


  home.file = {
  };

  programs.home-manager.enable = true;
  
}
