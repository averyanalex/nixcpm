{
  users = {
    mutableUsers = false;
    users = {
      user = {
        isNormalUser = true;
        description = "Whiteboard User";
        uid = 1000;
        password = "board";
      };
      alex = {
        isNormalUser = true;
        description = "Alexander Averyanov";
        extraGroups = [ "wheel" ];
        uid = 1500;
        hashedPassword = "$y$j9T$kKtru30hNHbaTUELQ40Qj1$aCaFRm6gcXjrUnWy25bPsEyawvgkqVrhNKm2GqfYnqC";
        openssh.authorizedKeys.keys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDP6BYhOQG5swda8e3YRo4LqhdNNAQd3NwkQME193izZ alex@averyan.ru" ];
      };
    };
  };
}
