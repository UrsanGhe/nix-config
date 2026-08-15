{ inputs, ... }:
{
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  environment.pathsToLink = [
    "/share/applications"
    "/share/xdg-desktop-portal"
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "bkp";
  };
}
