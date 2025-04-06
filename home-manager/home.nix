{ config, pkgs, unstable, ... }:
let
  fhsEnv = pkgs.buildFHSUserEnv {
    name = "fhs-java-env";
    targetPkgs = pkgs: [
      pkgs.openjdk
      pkgs.jetbrains.idea-ultimate
    ];
  };
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
      ]
    ))
    go
    flutter
    unstable.simplex-chat-desktop
    unstable.zotero
    gimp
    wp-cli
    arduino-ide
    fw-ectool
    flashrom
    minicom
    xz
    gh
    fhsEnv
    inkscape
    neofetch
    electrum
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
    caido
    openvpn
    i2p
    i2pd
    traceroute
    inetutils
    frr
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

  home.file = { };

  programs.home-manager.enable = true;
}

