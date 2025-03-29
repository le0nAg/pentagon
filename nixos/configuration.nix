{ config, pkgs, ... }:
let

in
{
  # Core system imports
  imports = [ 
    ./hardware-configuration.nix  
    ./vm.nix                      
    ./users.nix                   
    ./services/databases.nix      
  ];

  # Boot configuration
  boot = {
    loader = {
      systemd-boot.enable = true;     
      efi.canTouchEfiVariables = true; 
      grub.memtest86.enable = true;
    };
  };

  # Network configuration
  networking = {
    hostName = "nixos";
    networkmanager.enable = true;      
    # wireless.enable = true;          # Uncomment for wpa_supplicant (WiFi)
  };

  # Localization settings
  time.timeZone = "Europe/Rome";
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "it_IT.UTF-8";
      LC_IDENTIFICATION = "it_IT.UTF-8";
      # ... (other locale settings)
    };
  };

  # System services
  services = {
    fwupd.enable = true;
    
    # X11 Window System configuration
    xserver = {
      enable = true;
      xkb.layout = "us";
      displayManager.gdm = {
        enable = true;
        wayland = true;
      };
      desktopManager.gnome.enable = true;
      excludePackages = [ pkgs.xterm ];
    };

    # Sound configuration
    pipewire = {
      enable = true;                   
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    # Hardware-related services
    printing.enable = true;
    blueman.enable = true;
    fprintd.enable = true;

    # Power management
    power-profiles-daemon.enable = false;
    tlp.enable = true;
  };

  # Security configuration
  security.rtkit.enable = true;

  # Nix package manager settings
  nix = {
    settings.experimental-features = [ 
      "nix-command" "flakes"          # Enable new Nix features
    ];
  };

  # Virtualization setup
  virtualisation.docker = {
    enable = true;
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };

  # Development tools configuration
  programs = {
    nix-ld = {
      enable = true;
      libraries = with pkgs; [
        glibc stdenv.cc.cc zlib fuse3
      ];
    };
    java = {
      enable = true;          
      package = pkgs.jdk17;
    };
  };

  # System-wide packages
  environment.systemPackages = with pkgs; [
    # Core utilities
    vim wget git
    
    # Development tools
    gcc python3 nodejs_22
    
    # Hardware monitoring
    lm_sensors smartmontools
    
    # Java versions
    openjdk8 openjdk11 openjdk17 openjdk21
  ];

  # Hardware configuration
  hardware = {
    pulseaudio.enable = false;         
    bluetooth = {
      enable = true;                   
      settings.General.Experimental = true;
    };
  };

  # System-wide settings
  system = {
    autoUpgrade = {
      enable = true;
      allowReboot = true;
    };
    stateVersion = "24.11";
  };
}