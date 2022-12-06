{ inputs, pkgs, ... }:
{
  imports = [
    inputs.self.nixosModules.roles.board
    inputs.self.nixosModules.hardware.board
  ];

  system.stateVersion = "22.11";

  networking.hostName = "board";

  networking.interfaces.enp0s31f6.useDHCP = true;

  fileSystems = {
    "/persist" = {
      device = "/dev/sda2";
      fsType = "ext4";
      options = [ "discard" ];
    };
    "/boot" = {
      device = "/dev/sda1";
      fsType = "vfat";
    };
  };
}
