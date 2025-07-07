{ ... }:
{
  wayland.windowManager.hyprland = {
    settings = {
      monitor = [
        ",preferred,auto,auto"
        "eDP-1, 1920x1200@60, 0x0, 1.25"
        #",preferred,auto,auto, mirror, eDP-1"
        #"eDP-1, 1920x1200@60, 0x0, 1.5"
      ];
      exec-once = [
        "systemctl --user start hyprpolkitagent"
        "waybar & hyprpaper"
      ];

      xwayland = {
        force_zero_scaling = true;
      };

      # env = {
      #   XCURSOR_SIZE = "24";
      #   HYPRCURSOR_SIZE = "24";
      # };

      
      general = {
        "$mainMod" = "SUPER";
        layout = "dwindle";
        gaps_in = 4;
        gaps_out = 6;
        border_size = 0;
        "col.active_border" = "rgb(98971A) rgb(CC241D) 45deg";
        "col.inactive_border" = "0x00000000";
        resize_on_border = false;
        allow_tearing = false;
      };

      misc = {
        force_default_wallpaper = 0;
        disable_hyprland_logo = true;
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      master = {
        new_status = "master";
      };

      decoration = {
        rounding = 4;
        rounding_power = 2;
        active_opacity = 1.0;
        inactive_opacity = 1.0;
        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
          color = "rgba(1a1a1aee)";
        };
        blur = {
          enabled = true;
          size = 3;
          passes = 1;
          vibrancy = 0.1696;
        };
      };

      animations = {
        enabled = "no";
        bezier = [
          "easeOutQuint,0.23,1,0.32,1"
          "easeInOutCubic,0.65,0.05,0.36,1"
          "linear,0,0,1,1"
          "almostLinear,0.5,0.5,0.75,1.0"
          "quick,0.15,0,0.1,1"      
        ];
        animation = [
          "global, 1, 10, default"
          "border, 1, 5.39, easeOutQuint"
          "windows, 1, 4.79, easeOutQuint"
          "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
          "windowsOut, 1, 1.49, linear, popin 87%"
          "fadeIn, 1, 1.73, almostLinear"
          "fadeOut, 1, 1.46, almostLinear"
          "fade, 1, 3.03, quick"
          "layers, 1, 3.81, easeOutQuint"
          "layersIn, 1, 4, easeOutQuint, fade"
          "layersOut, 1, 1.5, linear, fade"
          "fadeLayersIn, 1, 1.79, almostLinear"
          "fadeLayersOut, 1, 1.39, almostLinear"
          "workspaces, 1, 1.94, almostLinear, fade"
          "workspacesIn, 1, 1.21, almostLinear, fade"
          "workspacesOut, 1, 1.94, almostLinear, fade"
        ];
      };
      bind = [
        "$mainMod, F, fullscreen, 1"
        "$mainMod SHIFT, F, fullscreen, 0"
        "$mainMod, RETURN, exec, alacritty"
        "$mainMod, Q, killactive"
        "$mainMod, M, exit"
        #"$mainMod, R, exec, rofi -show drun -show-icons -theme ~/.local/share/rofi/themes/rounded-blue-dark.rasi"
        "$mainMod, R, exec, rofi -show drun -show-icons"
        "$mainMod, V, togglefloating"
        "$mainMod, P, pseudo"
        "$mainMod, J, togglesplit"

        # Screenshot
        ", Print, exec, grim -g \"$(slurp)\" - | swappy -f -"

        # Monitor setting
        "$mainMod, N, exec, hyprctl monitor eDP-1,1920x1200@60,0x0,1.25; hyprctl monitor ,preferred,auto,auto"

        # Focus
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"

        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        # same as above, but switch to the workspace
        "$mainMod SHIFT, 1, movetoworkspacesilent, 1" # movetoworkspacesilent
        "$mainMod SHIFT, 2, movetoworkspacesilent, 2"
        "$mainMod SHIFT, 3, movetoworkspacesilent, 3"
        "$mainMod SHIFT, 4, movetoworkspacesilent, 4"
        "$mainMod SHIFT, 5, movetoworkspacesilent, 5"
        "$mainMod SHIFT, 6, movetoworkspacesilent, 6"
        "$mainMod SHIFT, 7, movetoworkspacesilent, 7"
        "$mainMod SHIFT, 8, movetoworkspacesilent, 8"
        "$mainMod SHIFT, 9, movetoworkspacesilent, 9"
        "$mainMod SHIFT, 0, movetoworkspacesilent, 10"
        "$mainMod CTRL, c, movetoworkspace, empty"

        # window control
        "$mainMod SHIFT, left, movewindow, l"
        "$mainMod SHIFT, right, movewindow, r"
        "$mainMod SHIFT, up, movewindow, u"
        "$mainMod SHIFT, down, movewindow, d"
        "$mainMod SHIFT, h, movewindow, l"
        "$mainMod SHIFT, j, movewindow, d"
        "$mainMod SHIFT, k, movewindow, u"
        "$mainMod SHIFT, l, movewindow, r"

        "$mainMod CTRL, left, resizeactive, -80 0"
        "$mainMod CTRL, right, resizeactive, 80 0"
        "$mainMod CTRL, up, resizeactive, 0 -80"
        "$mainMod CTRL, down, resizeactive, 0 80"
        "$mainMod CTRL, h, resizeactive, -80 0"
        "$mainMod CTRL, j, resizeactive, 0 80"
        "$mainMod CTRL, k, resizeactive, 0 -80"
        "$mainMod CTRL, l, resizeactive, 80 0"

        "$mainMod ALT, left, moveactive,  -80 0"
        "$mainMod ALT, right, moveactive, 80 0"
        "$mainMod ALT, up, moveactive, 0 -80"
        "$mainMod ALT, down, moveactive, 0 80"
        "$mainMod ALT, h, moveactive,  -80 0"
        "$mainMod ALT, j, moveactive, 0 80"
        "$mainMod ALT, k, moveactive, 0 -80"
        "$mainMod ALT, l, moveactive, 80 0"

        # Example special workspace (scratchpad)
        "$mainMod, S, togglespecialworkspace, magic"
        "$mainMod SHIFT, S, movetoworkspace, special:magic"

        # Scroll through existing workspaces with mainMod + scroll
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"
      ];

      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      bindel = [
        ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ",XF86MonBrightnessUp, exec, brightnessctl s 10%+"
        ",XF86MonBrightnessDown, exec, brightnessctl s 10%-"
      ];
      bindl = [
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPause, exec, playerctl play-pause"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPrev, exec, playerctl previous"
      ];

      windowrule = [
        "float,class:^(mpv)$"
        "float,title:^(Firefox — Sharing Indicator)$"
        "float, class:^(org.kde.dolphin)$"
        "float, class:^(Thunar)$"
        "float, class:^(thunar)$"
        "float, class:^(org.pulseaudio.pavucontrol)$"
        "float, class:^(org.gnome.Nautilus)$"
        "float, title:^(Heroic Games Launcher)$"
        "float, title:^(Open Folder)$"
        "float, title:^(Login - Akun Google — Mozilla Firefox)$"
        "float, title:^(Remmina Remote Desktop Client)$"
        "float, title:^(Welcome to Android Studio)$"
        "float, title:^(Virtual Machine Manager)$"
      ];

      workspace = [
        "f[0],rounding:false,bordersize:0,gapsout:0"
        "f[1],rounding:false,bordersize:0,gapsout:0"
      ];

    };
    extraConfig = "

      env=ELECTRON_OZONE_PLATFORM_HINT
     
    ";
  };
}