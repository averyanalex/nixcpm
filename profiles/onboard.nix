{ pkgs, ... }:
{
  home-manager.users.user = {
    home.packages = with pkgs; [ onboard ];
  };

  home-manager.users.user.dconf.settings = {
    "org/onboard/window/landscape" = {
      height = 420;
      width = 1400;
    };
    "org/onboard/window" = {
      docking-enabled = false;
      transparency = 10;
    };
    "org/onboard" = {
      layout = "${pkgs.onboard}/share/onboard/layouts/Full Keyboard.onboard";
    };
  };
}
