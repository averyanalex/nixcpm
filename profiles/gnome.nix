{ pkgs, ... }:
{
  services.xserver.enable = true;

  services.xserver.displayManager = {
    autoLogin.user = "user";
    # defaultSession = "plasmawayland";
    gdm = {
      enable = true;
      wayland = true;
    };
  };
  services.xserver.desktopManager.gnome.enable = true;

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
    evince # document viewer
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
