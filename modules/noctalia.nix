{ inputs, ... }:
{
  home-manager.sharedModules = [
    {
      imports = [ inputs.noctalia.homeModules.default ];
      programs.noctalia = {
        enable = true;
        systemd.enable = true;
        settings = {

          wallpaper.enabled = false;
          dock.enabled = false;

	  theme = {
	    mode = "dark";
	    templates = {
	      enable_builtin_templates = false;
	      enable_community_templates = false;
	    };
	  };

	  shell = {
	    setup_wizard_enabled = false;
	    panel = {
	      transparency_mode = "solid";
	      borders = false;
   	      shadow = false;
	    };
	  }; 

          bar = {
            order = [ "main" ];
            main = {
              enabled = true;
              position = "top";
	      auto_hide = false;
	      reserve_space = true;
	      layer = "top";
	      thickness = 30;
	      padding = 4;
	      widget_spacing = 7;
	      background_opacity = 0.0;
	      border_width = 0.0;
	      shadow = false;
	      capsule = false;
	      radius = 12;
	      margin_ends = 9;
	      margin_edge = 4;
	      scale = 1.0;
	      font_family = "JetBrainsMono Nerd Font";
	      font_weight = "semibold";
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
