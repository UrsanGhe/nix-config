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
          lockscreen = {
	    enabled = true;
	    blurred_desktop = true;
 	    blur_intensity = 0.1;
	    tint_intensity = 0.0;
	  };
          
	  idle = {
	    pre_action_fade_seconds = 1.0;
	    behavior = {
              lock = {
	        timeout = 3600;
		action = "lock";
		enabled = true;
	      };
              "screen-off" = {
 		timeout = 0;
		action = "screen_off";
		enabled = false;
    	      };
              suspend = {
	        timeout = 0;
		action = "lock_and_suspend";
		enabled = true;
	      };
            };
          };  
	};   
      };
    }
  ];
}
