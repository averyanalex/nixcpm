{ pkgs, ... }:
{
  home-manager.users.user = {
    home.packages = [ pkgs.libreoffice-fresh ];
  };
}
