{
  services.xserver.enable = true;

  services.xserver.displayManager = {
    autoLogin.user = "user";
    defaultSession = "plasmawayland";
    gdm = {
      enable = true;
      wayland = true;
    };
  };
  services.xserver.desktopManager.plasma5.enable = true;
}
