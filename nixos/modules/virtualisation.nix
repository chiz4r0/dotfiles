{...}: {
  programs.virt-manager.enable = true;
  users.groups.libvirtd.members = ["tabun"];
  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;
  virtualisation.docker.enable = true;
}
