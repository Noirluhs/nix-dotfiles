{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  networking.networkmanager.enable = true;

  time.timeZone = "America/New_York";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  security.rtkit.enable = true;
  services = {
    desktopManager.plasma6.enable = true;
    # displayManager = {
    #  defaultSession = "none+i3";
    # };
    displayManager.sddm.enable = true;
    pipewire = {
      enable = true;
      alsa = {
       enable = true;
       support32Bit = true;
      };
      pulse.enable = true;
    };
    xserver = {
      enable = true;
      # desktopManager.xterm.enable = false;
      # windowManager.i3.enable = true;
      xkb = {
        layout = "us";
        variant = "";
      };
    };
  };

  programs = {
    zsh.enable = true;
    # bash.enable = false;
    nix-ld = {
      enable = true;
      libraries = with pkgs; [
        llvm_17
        clang_17
        zig
        nasm
        fasm
        rustup
        cargo
        rustc
        openjdk
      ];
    };
  };

  users.users.noir = {
    isNormalUser = true;
    description = "noir";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
    shell = pkgs.zsh;
  };

  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = ["nix-command" "flakes"];

  environment.systemPackages = with pkgs; [
    neovim
    curl
    wget
    gcc
    firefox
    llvm_17
    clang_17
    zig
    nasm
    fasm
    cargo
    rustup
    rustc
    git
    quickemu
    openjdk
    waydroid
  ];

  system.stateVersion = "24.05"; # Did you read the comment?

}
