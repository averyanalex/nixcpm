{ lib, pkgs, ... }:
{
  fonts = {
    fonts = with pkgs; [ corefonts ];
    enableDefaultFonts = true;
  };

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "corefonts"
  ];
}
