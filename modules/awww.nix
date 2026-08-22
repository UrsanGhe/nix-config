{ inputs, pkgs, ... }:
let
  awww = inputs.awww.packages.${pkgs.stdenv.hostPlatform.system}.awww;
  wallpaper = ../assets/wallpaper.jpg;
in
{
  environment.systemPackages = [
    awww
  ];


  systemd.user.services.awww-daemon = {
    description = "An Answer to your Wayland Wallpaper Woes";
    documentation = [ "man:awww-daemon(1)" ];
    partOf = [ "graphical-session.target" ];
    after = [ "graphical-session.target" ];
    requisite = [ "graphical-session.target" ];
    wantedBy = [ "graphical-session.target" ];
    serviceConfig = {
      Type = "simple";
      ExecStart = "${awww}/bin/awww-daemon";
      ExecStartPost = "${awww}/bin/awww img ${wallpaper}";
      Restart = "on-failure";
    };
  };
}
