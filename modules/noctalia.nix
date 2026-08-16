{ inputs, ... }:
{
  home-manager.sharedModules = [
    {
      imports = [ inputs.noctalia.homeModules.default ];
      programs.noctalia = {
        enable = true;
        systemd.enable = true;
        settings = {
          shell.setup_wizard_enabled = false;
          wallpaper.enabled = false;
          dock.enabled = false;
          bar = {
            order = [ "main" ];
            main = {
              enabled = true;
              position = "top";
              start = [ "workspaces" ];
              center = [ "active_window" ];
              end = [ "tray" "volume" "network" "battery" "clock" ];
            };
          };
        };
      };
    }
  ];
}
