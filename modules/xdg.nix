{ pkgs, ... }:
{
  xdg.portal = {
    enable = true;
   
    extraPortals = with pkgs; [
      xdg-desktop-portal-gnome
      xdg-desktop-portal-gtk
    ];


    config.niri = {
      default = [
        "gnome"
	"gtk"
      ];
 
    "org.freedesktop.impl.portal.OpenURI" = [ "gtk" ];
    "org.freedesktop.impl.portal.FileChooser" = [ "gtk" ];
    };
  };
}
