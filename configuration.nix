{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Enable networking
  networking.networkmanager.enable = true;

  # Enable bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  # Enable sound
  # hardware.pulseaudio.enable = true;
  # Set your time zone.
  time.timeZone = "Europe/Paris";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fr_FR.UTF-8";
    LC_IDENTIFICATION = "fr_FR.UTF-8";
    LC_MEASUREMENT = "fr_FR.UTF-8";
    LC_MONETARY = "fr_FR.UTF-8";
    LC_NAME = "fr_FR.UTF-8";
    LC_NUMERIC = "fr_FR.UTF-8";
    LC_PAPER = "fr_FR.UTF-8";
    LC_TELEPHONE = "fr_FR.UTF-8";
    LC_TIME = "fr_FR.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "fr";
    variant = "";
  };

  services.displayManager.sddm = {
  	enable = true;
    wayland.enable = true;
  };

  programs.hyprland = {
	  enable = true;
	  xwayland.enable = true;
  };

  # Configure console keymap
  console.keyMap = "fr";

  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.maskrpone = {
    shell = pkgs.zsh;
    isNormalUser = true;
    description = "Maskrpone";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    	swww
      vscode
      discord
      firefox
      alacritty
      rofi-wayland
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable flakes on the system
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  environment.systemPackages = with pkgs; [
     neovim
     wget
     git
     curl
     gnome.gnome-keyring
     psmisc
     alsa
     alsa-utils
     pavucontrol
  ];

  services = {
      gnome.gnome-keyring.enable = true;
    };

  fonts.packages = with pkgs; [
     (nerdfonts.override { fonts = [ "Hack" ]; })
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };


  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  system.stateVersion = "24.05"; # Do not change this value

}
