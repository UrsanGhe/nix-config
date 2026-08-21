{ inputs, pkgs,  ... }:
{
  imports = [ inputs.niri.nixosModules.niri ];

  nixpkgs.overlays = [ inputs.niri.overlays.niri ];

  programs.niri.enable = true;
  programs.niri.package = pkgs.niri-stable;

  environment.systemPackages = with pkgs; [
    alacritty
    fuzzel
    wl-clipboard
    grim
    slurp
    xwayland-satellite-stable
  ];

  services.libinput.enable = true;
  programs.xwayland.enable = true;

  home-manager.sharedModules = [
    {
      programs.niri = {

        package = pkgs.niri-stable;
        settings = {
  
          spawn-at-startup = [
            { command = [ "noctalia-shell" ]; }
          ];
          
          prefer-no-csd = true;
         
          input.keyboard.xkb.layout = "us";

          layout = {
	    background-color = "#000000";
            gaps = 8;
  	   
   	    default-column-width = {
  	      proportion = 0.5;
	     };
           
	    border = {
              enable = true;
	      width = 1;
 	    };
            
	    preset-column-widths = [
              { proportion = 0.25; }
              { proportion = 0.5; }
              { proportion = 0.75; }
              { proportion = 1.0; }
            ];
	};

	    window-rules = [
	      {
                draw-border-with-background = false;
	        geometry-corner-radius = {
	          top-left = 4.0;
	   	  top-right = 4.0;
		  bottom-left = 4.0;
	          bottom-right = 4.0;
		};
		clip-to-geometry = true;
	      }
  	  ];
          
	  
	  
	  binds = {
	    "Super+Space".action.spawn-sh = "noctalia msg panel-toggle launcher";
 	    "Super+Return".action.spawn = "ghostty";
 	    "Super+Q".action.close-window = { };
 	    "Super+Left".action.focus-column-left = { };
 	    "Super+Right".action.focus-column-right = { };
 	    "Super+Up".action.focus-workspace-up = { };
 	    "Super+Down".action.focus-workspace-down = { };
 	    "Super+F".action.maximize-column = { };
	    "Super+Shift+S".action.screenshot = { };
	    "Super+S".action.switch-preset-column-width = { };
	    "Super+Shift+F".action.fullscreen-window = { };
	    "Super+Shift+Left".action.move-column-left = { };
	    "Super+Shift+Right".action.move-column-right = { };
	    "Super+Shift+Up".action.move-column-to-workspace-up = { };
	    "Super+Shift+Down".action.move-column-to-workspace-down = { };
	    "Super+Comma".action.consume-window-into-column = { };
	    "Super+Period".action.expel-window-from-column = { };
	  };
        };
      };
    }   
  ];
}
