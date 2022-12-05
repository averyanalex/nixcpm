{ inputs, ... }:

{
  imports = [
    inputs.home-manager.nixosModule
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    users.user = {
      programs.home-manager.enable = true;

      home = {
        username = "user";
        homeDirectory = "/home/user";
        stateVersion = "22.11";
      };
    };
  };
}
