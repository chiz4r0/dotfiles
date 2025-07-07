# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      inputs.home-manager.nixosModules.home-manager
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "cat-linux"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "Asia/Jakarta";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

  # Enable the X11 windowing system.
  # services.xserver.enable = true;


  # Enable the GNOME Desktop Environment.
  # services.xserver.displayManager.gdm.enable = true;
  # services.xserver.desktopManager.gnome.enable = true;
  

  # Configure keymap in X11
  # services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # services.pulseaudio.enable = true;
  # OR
  # services.pipewire = {
  #   enable = true;
  #   pulse.enable = true;
  # };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;
  nixpkgs.config.allowUnfree = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.tabun = {
    isNormalUser = true;
    extraGroups = [ "wheel" "audio" "video" "disk" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      tree
    ];
  };

  ### Home Manager
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    users.tabun = {
      home.packages = with pkgs; [
        vscode
      ];

      programs.git = {
        enable = true;
  	userEmail = "yurandarezky@gmail.com";
  	userName = "chiz4r0";
      };
      home.sessionVariables = {
        # 🖥️ Wayland & Hyprland Session
        XDG_SESSION_TYPE = "wayland";
        XDG_SESSION_DESKTOP = "Hyprland";
        XDG_CURRENT_DESKTOP = "Hyprland";
        GDK_BACKEND = "wayland";
        SDL_VIDEODRIVER = "wayland";
        CLUTTER_BACKEND = "wayland";
        ELECTRON_OZONE_PLATFORM_HINT = "wayland";
        # 🌐 Firefox / Electron / Chromium
        MOZ_ENABLE_WAYLAND = "1";
        NIXOS_OZONE_WL = "1";  # Chromium-based apps (Electron, Brave, VSCodium, etc.)

        # 🧪 Wayland tweaks
        WLR_RENDERER = "vulkan";            # Vulkan renderer for wlroots compositors (Hyprland)
        WLR_BACKEND = "vulkan";
        WLR_NO_HARDWARE_CURSORS = "1";      # Optional, helps if cursor glitches
        WLR_DRM_NO_ATOMIC = "1";            # Helps with some legacy GPUs
        GRIMBLAST_HIDE_CURSOR = "0";        # Screenshot tool behavior

        # 🎨 GTK/Qt scaling and themeing
        GDK_SCALE = "1";
        GDK_DPI_SCALE = "1";
        QT_QPA_PLATFORM = "wayland";        # Native Qt Wayland backend
        QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
        QT_AUTO_SCREEN_SCALE_FACTOR = "1";
        QT_SCALE_FACTOR = "1";
        QT_STYLE_OVERRIDE = "kvantum";      # Optional Qt theme override
        QT_QPA_PLATFORMTHEME = "qt5ct";     # Qt settings control

        # ☕ Java/AWT (Android Studio, IntelliJ, etc.)
        _JAVA_AWT_WM_NONEREPARENTING = "1";  # Required for Java apps in tiling Wayland WMs
        _JAVA_OPTIONS = "-Dsun.java2d.uiScale=1.0 -Dsun.java2d.xrender=true"; # Prevent scaling blur

        # 📦 Direnv / Dev stuff
        DIRENV_LOG_FORMAT = "";

        # 🔄 Optional NVIDIA VRR tweaks
        __GL_GSYNC_ALLOWED = "0";
        __GL_VRR_ALLOWED = "0";

        # ⛔ Optional override, if you don't want QT5 theme fallback
        DISABLE_QT5_COMPAT = "0";
      };
      home.username = "tabun";
      home.homeDirectory = "/home/tabun";
      home.stateVersion = "24.05";
      programs.home-manager.enable = true;
    };
  };

  programs.firefox.enable = true;
  programs.hyprland.enable = true;
  
  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
  environment.systemPackages = with pkgs; [
    git
    kitty
    wmenu
    vim
    wget
  ];

  system.stateVersion = "25.05"; # Did you read the comment?
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

}

