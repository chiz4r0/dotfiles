{pkgs, ...}: {
  boot = {
    extraModulePackages = [config.boot.kernelPackages.evdi];
    initrd = {
      # List of modules that are always loaded by the initrd.
      kernelModules = [
        "evdi"
      ];
    };
  };
  services.xserver.videoDrivers = ["displaylink" "modesetting"];

  environment.systemPackages = with pkgs; [
    displaylink
  ];

  systemd.services.dlm.wantedBy = ["multi-user.target"];
}
