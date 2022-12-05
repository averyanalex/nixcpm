{
  services.xserver.enable = true;

  services.xserver.displayManager = {
    autoLogin.user = "user";
    defaultSession = "plasmawayland";
    sddm.enable = true;
  };
  services.xserver.desktopManager.plasma5.enable = true;
}
