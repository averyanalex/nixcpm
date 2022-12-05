{ pkgs, ... }:
{
  home-manager.users.user = {
    home.packages = with pkgs; [ openboard rnote lorien ];
  };

  nixpkgs.config.permittedInsecurePackages = [
    "qtwebkit-5.212.0-alpha4"
  ];

  # persist.state.homeDirs = [ ".local/share/OpenBoard" ];
}
