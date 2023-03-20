{ pkgs, ... }:
{
  services.xserver = {
    enable = true;

    displayManager = {
      autoLogin.user = "user";
      # defaultSession = "gnome-xorg";
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
    baobab
    gnome-connections
    gnome-photos
    gnome-tour
  ]) ++ (with pkgs.gnome; [
    atomix # puzzle game
    cheese # webcam tool
    epiphany # web browser
    geary # email reader
    gedit # text editor
    gnome-characters
    gnome-contacts
    gnome-font-viewer
    gnome-logs
    gnome-maps
    gnome-music
    gnome-terminal
    hitori # sudoku game
    iagno # go game
    simple-scan
    tali # poker game
    totem # video player
  ]);

  programs.gnome-disks.enable = false;

  environment.systemPackages = [ pkgs.gnomeExtensions.dash-to-dock ];

  home-manager.users.user.dconf.settings = {
    "org/gnome/desktop/background" = {
      # picture-uri = "file://${../../assets/wallpaper.png}";
    };

    "org/gnome/shell/extensions/dash-to-dock" = {
      dock-fixed = true;
      extend-height = true;
      show-trash = false;
      show-mounts-only-mounted = false;
      disable-overview-on-startup = true;
    };

    "org/gnome/mutter" = {
      dynamic-workspaces = false;
      experimental-features = [ "scale-monitor-framebuffer" "x11-randr-fractional-scaling" ];
    };
    "org/gnome/shell/overrides" = {
      dynamic-workspaces = false;
    };

    "org/gnome/desktop/screensaver" = {
      lock-enabled = false;
      user-switch-enabled = false;
    };
    "org/gnome/desktop/session" = {
      idle-delay = 0;
    };
    "org/gnome/desktop/lockdown" = {
      disable-lock-screen = true;
      disable-log-out = true;
      disable-user-switching = true;
      user-administration-disabled = true;
    };
    "org/gnome/desktop/notifications" = {
      show-banners = false;
    };
    "org/gnome/desktop/wm/preferences" = {
      button-layout = "appmenu:minimize,maximize,close";
      num-workspaces = 1;
    };
    "org/gnome/desktop/interface" = {
      font-antialiasing = "rgba";
    };
    "org/gnome/settings-daemon/plugins/power" = {
      idle-dim = false;
      # power-button-action = "poweroff";
      sleep-inactive-ac-type = "nothing";
    };
    "org/gnome/shell" = {
      enabled-extensions = [ "dash-to-dock@micxgx.gmail.com" ];
      favorite-apps = [
        "org.gnome.Nautilus.desktop"
        "onboard.desktop"
        "com.github.flxzt.rnote.desktop"
        "OpenBoard.desktop"
        "writer.desktop"
        "impress.desktop"
        "calc.desktop"
        "chromium-browser.desktop"
      ];
    };
  };

  home-manager.users.user = {
    home.packages = with pkgs; [ gnome.gnome-tweaks gnome.dconf-editor ];
    home.file.".config/monitors.xml".source = ./monitors.xml;
  };
}
