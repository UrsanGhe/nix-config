{ pkgs, ... }:
{
  imports = [
    ./hardware.nix
    ../../modules/nix.nix
    ../../modules/nixpkgs.nix
    ../../modules/time.nix
    ../../modules/localisation.nix
    ../../modules/packages.nix
    ../../modules/boot.nix
    ../../modules/networking.nix
    ../../modules/pipewire.nix
    ../../modules/desktop.nix
    ../../modules/flatpak.nix
    ../../modules/gnome-exclude.nix
    ../../modules/nvidia.nix
    ../../modules/home-manager.nix
    ../../modules/niri.nix
    ../../modules/tuigreet.nix
  ];

  networking.hostName = "ursan";
  
  users.users.ursan = {
    isNormalUser = true;
    description = "Ursan";
    name = "ursan";
    home = "/home/ursan";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

  home-manager.users.ursan = {
    home = {
      homeDirectory = "/home/ursan";
      stateVersion = "26.05";
    };
  };

  system.stateVersion = "26.05";
}

