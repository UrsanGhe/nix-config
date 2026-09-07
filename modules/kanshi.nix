{ inputs, pkgs, ... }:
let
  awww = inputs.awww.packages.${pkgs.stdenv.hostPlatform.system}.awww;
  wallpaper = ../assets/wallpaper.jpg;
in
{
  home-manager.sharedModules = [
    {
      services.kanshi = {
        enable = true;
        package = pkgs.kanshi;
        systemdTarget = "graphical-session.target";

        settings = [
          {
            profile = {
              name = "hdmi-only";
              outputs = [
                {
                  criteria = "HDMI-A-1";
                  status = "enable";
                  mode = "2560x1440@144";
                  position = "0,0";
                  scale = 1.0;
                }
              ];
            };
          }
          {
            profile = {
              name = "dp-only";
              outputs = [
                {
                  criteria = "DP-2";
                  status = "enable";
                  mode = "1920x1080@144";
                  position = "0,0";
                  scale = 1.0;
                }
              ];
            };
          }
          {
            profile = {
              name = "dual";
              outputs = [
                {
                  criteria = "HDMI-A-1";
                  status = "enable";
                  mode = "2560x1440@144";
                  position = "0,0";
                  scale = 1.0;
                }
                {
                  criteria = "DP-2";
                  status = "enable";
                  mode = "1920x1080@144";
                  position = "2560,0";
                  scale = 1.0;
                }
              ];
              exec = [
                "${awww}/bin/awww img ${wallpaper}"
              ];
            };
          }
        ];
      };
    }
  ];
}
