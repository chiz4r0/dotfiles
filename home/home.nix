{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./modules/alacritty
    ./modules/direnv
    ./modules/git
    ./modules/hyprland
    ./modules/kitty
    ./modules/neovim
    ./modules/tmux
    ./modules/zsh
  ];

  home.packages = with pkgs; [
    android-studio
    pop-gtk-theme
    gpu-screen-recorder # CLI
    gpu-screen-recorder-gtk # GUI
    gvfs
    libreoffice-fresh
    mpv
    obsidian
    remmina
    vscode
    yazi
    zotero
  ];
}
