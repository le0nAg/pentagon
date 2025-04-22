# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{ config, pkgs, unstable, ... }:
let
  # fhsEnv = pkgs.buildFHSUserEnv {
  #   name = "fhs-java-env";
  #   targetPkgs = pkgs: [
  #     pkgs.openjdk
  #     pkgs.jetbrains.idea-ultimate
  #   ];
  # };
  python = pkgs.python3;

in
{
  imports = [
    ides/vscode.nix
    ides/nvim.nix
    ides/eclipse.nix
    ides/jetbrains.nix
    ides/android_studio.nix

    # ricing/hyprland.nix

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


  home = {
    username = "leonardo";
    homeDirectory = "/home/leonardo";
    stateVersion = "24.11";
    file = {};

    # activation = {
    #   removeExistingFiles = lib.hm.dag.entryBefore ["writeBoundary"] ''
    #     # Aggiungi qui i path dei file che causano conflitti, ad esempio:
    #     # rm -f $HOME/.config/specific-file-causing-conflict.conf
    #   '';
    # };
  };

  # Add stuff for your user as you see fit:
  # home.packages = with pkgs; [ steam ];
  # programs.bash = {
  #   enable = true;
  #   shellAliases = {
  #     hacking = "nix-shell ~/hacking/shell.nix";
  #   };
  # };

  
  home.packages = with pkgs; [
    patchelf
    glib
    openjfx
    gtk3
    file
    android-tools
    cmake
    gnumake
    meson
    ninja
    tree
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
        scipy
      ]
    ))

    # go
    # flutter
    unstable.simplex-chat-desktop
    unstable.zotero
    gimp
    wp-cli
    arduino-ide
    fw-ectool
    # flashrom
    # minicom
    xz
    
    # fhsEnv
    neofetch
    electrum

    ngrok
    rizinPlugins.rz-ghidra
    nmap
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
    unstable.burpsuite
    zap
    ghidra
    rizin
    caido
    openvpn
    
    i2p
    i2pd
    
    traceroute
    inetutils
    
    zoxide
    xwayland
    dbeaver-bin
    postman
    mongodb-compass
    mongosh
    gephi
    libreoffice-qt
    obsidian
    keepassxc
    glxinfo
  ];

  programs.home-manager.enable = true;

  systemd.user.startServices = "sd-switch";
}
