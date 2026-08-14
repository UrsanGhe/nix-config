{ pkgs, ... }:
{
  # Removing Apps
  environment.gnome.excludePackages = with pkgs; [
    gnome-photos
    gnome-tour
    xterm
    gnome-contacts
    gnome-maps
    gnome-weather
    gnome-clocks
    gnome-music
    geary
    epiphany 
  ];
}
