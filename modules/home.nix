{ config, pkgs, ... }:

{
  imports = [
    
  ];

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

    # ⛔ Optional override, if you don't want QT5 theme fallback
    DISABLE_QT5_COMPAT = "0";
  };

}