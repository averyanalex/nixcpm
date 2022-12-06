{ inputs, ... }:
{
  imports = (with inputs.averyanalex.nixosModules.modules; [
    persist
    yggdrasil
  ]) ++ (with inputs.averyanalex.nixosModules.profiles; [
    boot
    console
    dhcp
    dns
    nix
    pipewire
    polkit
    ruloc
    ssh-server
    sudo
    timezone
    vmvariant
    yggdrasil
  ]) ++ (with inputs.self.nixosModules.profiles; [
    autoupgrade
    board
    chromium
    fonts
    home
    libreoffice
    persist
    plasma
    plymouth
    sdboot
    users
  ]);
}
