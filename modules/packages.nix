{ pkgs, ... }:

{
  # Adding My Apps
  environment.systemPackages = with pkgs; [
    vscode
    git
    gh
    telegram-desktop
    discord
    code-cursor
    claude-code
    steam
  ];
  programs.steam = {
    enable = true;
  };

}
