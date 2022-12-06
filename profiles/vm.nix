# { lib, ... }:
{
  virtualisation.vmVariant.virtualisation = {
    cores = 4;
    diskSize = 2048;
    memorySize = 2048;

    # networking.interfaces.enp0s31f6.useDHCP = lib.mkOverride 200 false;
  };
}
