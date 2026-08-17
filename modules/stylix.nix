{ pkgs, inputs, ... }:
let
  darkScheme = {
    base00 = "#0a0c10";
    base01 = "#23252a";
    base02 = "#2672f3";
    base03 = "#5c6166";
    base04 = "#f0f6fc";
    base05 = "#f0f6fc";
    base06 = "#f0f6fc";
    base07 = "#f0f6fc";
    base08 = "#ff9492";
    base09 = "#ffb757";
    base0A = "#ffb757";
    base0B = "#addcff";
    base0C = "#ffb757";
    base0D = "#f0f6fc";
    base0E = "#ffb757";
    base0F = "#3D2F00";
  };
in
{
  programs.dconf.enable = true;

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.symbols-only
  ];


  home-manager.sharedModules = [
    {
      imports = [ inputs.stylix.homeModules.stylix ];

      stylix = {
        enable = true;
	autoEnable = true;
	overlays.enable = false;

	polarity = "dark"
	base165cheme = darkScheme;

	
	cursor = {
	  name = "Apple Cursor";
	  package = pkgs.apple-cursor;
	  size = 24;
	};

	
	fonts = {
	  serif = {
	    package = pkgs.nerd-fonts.jetbrains-mono;
	    name = "JetBrainsMono Nerd Font";
	  };
          sansSerif = {
            package = pkgs.nerd-fonts.jetbrains-mono;
            name = "JetBrainsMono Nerd Font";
          };
          monospace = {
            package = pkgs.nerd-fonts.jetbrains-mono;
            name = "JetBrainsMono Nerd Font";
          };
          emoji = {
            package = pkgs.nerd-fonts.symbols-only;
            name = "Symbols Nerd Font";
          };
          sizes.terminal = 14;
	};
      };
    }
  ];
}
