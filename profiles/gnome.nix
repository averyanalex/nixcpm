{ pkgs, ... }:
{
  services.xserver = {
    enable = true;

    displayManager = {
      autoLogin.user = "user";
      gdm = {
        enable = true;
        wayland = true;
      };
    };

    desktopManager.gnome.enable = true;

    layout = "ru,us";
    xkbOptions = "grp:win_space_toggle";
  };

  environment.gnome.excludePackages = (with pkgs; [
    gnome-photos
    gnome-tour
  ]) ++ (with pkgs.gnome; [
    cheese # webcam tool
    gnome-music
    gnome-terminal
    gedit # text editor
    epiphany # web browser
    geary # email reader
    gnome-characters
    totem # video player
    tali # poker game
    iagno # go game
    hitori # sudoku game
    atomix # puzzle game
  ]);

  home-manager.users.user.dconf.settings = {
    "org/gnome/desktop/screensaver" = {
      lock-enabled = false;
    };
    "org/gnome/desktop/lockdown" = {
      disable-lock-screen = true;
    };
    "org/gnome/shell" = {
      favorite-apps = [
        "org.gnome.Nautilus.desktop"
        "com.github.flxzt.rnote.desktop"
        "writer.desktop"
        "impress.desktop"
        "calc.desktop"
        "chromium-browser.desktop"
      ];
    };
  };
}
