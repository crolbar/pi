{pkgs, ...}: {
  time.timeZone = "Europe/Sofia";

  sdImage.compressImage = false;

  users = {
    mutableUsers = false;
    users.root.hashedPassword = "$y$j9T$vRxv3vPo5oX1UuiSmJF5V/$MzK8chBLfjKPtHJ1OiMOBAXe.i/ykFvclahtkUWUh8B";
    users.screw = {
      isNormalUser = true;
      extraGroups = ["networkmanager" "wheel" "docker"];
      hashedPassword = "$y$j9T$vRxv3vPo5oX1UuiSmJF5V/$MzK8chBLfjKPtHJ1OiMOBAXe.i/ykFvclahtkUWUh8B";
    };
  };

  system.stateVersion = "23.05";

  networking = {
    networkmanager.enable = true;
    hostName = "screw";
    interfaces.end0 = {
      ipv4.addresses = [
        {
          address = "192.168.1.11";
          prefixLength = 24;
        }
      ];
    };
    defaultGateway = {
      address = "192.168.1.1";
      interface = "end0";
    };
    nameservers = ["9.9.9.9"];
  };

  services.openssh.enable = true;
  services.sshd.enable = true;

  environment.systemPackages = with pkgs; [
    git
    htop
    vim
  ];
}
