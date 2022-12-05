{ inputs, pkgs, ... }:
{
  imports = [
    inputs.self.nixosModules.roles.board
    inputs.self.nixosModules.hardware.board
  ];

  system.stateVersion = "22.11";

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
