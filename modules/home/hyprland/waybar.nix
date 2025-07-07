{ inputs, pkgs, ... }:
{
  programs.waybar = {
    enable = true;
    settings = [{
      layer = "top";
      position = "top";
      height = 26;
      spacing = 5;

      modules-left = [ "hyprland/workspaces" "group/usage" ];
      modules-center = [ "clock" ];
      modules-right = [ "pulseaudio" "group/bat" "group/net" "tray" "custom/power" ];

      "group/usage" = {
        orientation = "horizontal";
        modules = [ "memory" "temperature" ];
      };

      "group/bat" = {
        orientation = "horizontal";
        modules = [ "battery" "backlight" ];
      };

      "group/net" = {
        orientation = "horizontal";
        modules = [ "network" ];
      };

      "hyprland/workspaces" = {
        format = "{icon}";
        on-click = "activate";
        format-icons = {
          "1" = "";
          "2" = "󰖟";
          "3" = "";
          "4" = "";
          "5" = "";
          "6" = "";
        };
        icon-size = 40;
        sort-by-number = true;
        persistent-workspaces = {
          "1" = [];
          "2" = [];
          "3" = [];
          "4" = [];
          "5" = [];
          "6" = [];
        };
      };

      clock = {
        format = "{:%d.%m.%Y | %H:%M}";
      };

      wireplumber = {
        format = "󰕾  {volume}%";
        max-volume = 100;
        scroll-step = 5;
        onclick = "pavucontrol";
      };

      pulseaudio = {
        format = "{volume}% {icon} {format_source}";
        format-bluetooth = "{volume}% {icon} {format_source}";
        format-bluetooth-muted = " {icon} {format_source}";
        format-muted = " {format_source}";
        format-source = "{volume}% ";
        format-source-muted = "";
        format-icons = {
          headphone = "";
          hands-free = "";
          headset = "";
          phone = "";
          portable = "";
          car = "";
          default = [ "" "" "" ];
        };
        on-click = "pavucontrol";
      };

      "custom/power" = {
        format = "⏻";
        tooltip = false;
        on-click = "wlogout";
      };

      battery = {
        bat = "BAT0";
        interval = 60;
        format = "{icon}  {capacity}%";
        format-icons = [ "" "" "" "" "" ];
      };

      backlight = {
        format = "󰃠  {percent}%";
      };

      memory = {
        interval = 30;
        format = "  {used:0.1f}G";
      };

      temperature = {
        format = " {temperatureC}°C";
      };

      network = {
        format-wifi = "{essid} ({signalStrength}%) ";
        format-ethernet = "{ipaddr}/{cidr} ";
        tooltip-format = "{ifname} via {gwaddr} ";
        format-linked = "{ifname} (No IP) ";
        format-disconnected = "Disconnected ⚠";
        format-alt = "{ifname}: {ipaddr}/{cidr}";
      };

      bluetooth = {
        format = "󰂱";
        format-disabled = "󰂲";
        format-connected = "󰥰";
        tooltip-format = "{controller_alias}\t{controller_address}";
        tooltip-format-connected = "{controller_alias}\t{controller_address}\n\n{device_enumerate}";
        tooltip-format-enumerate-connected = "{device_alias}\t{device_address}";
      };

      "hyprland/language" = {
        format = "{short}";
      };

      tray = {
        icon-size = 16;
        spacing = 16;
      };
    }];

    style = ''
      @define-color foreground #eff0f1;
      @define-color foreground-inactive #7f8c8d;
      @define-color background #232629;
      @define-color background-alt #31363b;

      * {
          font-family: Mononoki Nerd Font;
          font-size: 13px;
          padding: 0;
          margin: 0;
      }

      #waybar {
          color: @foreground;
          background-color: @background;
      }

      #workspaces button {
          padding-left: 0.7em;
          padding-right: 1em;
          color: #ffffff;
      }

      #workspaces button.empty {
          color: @foreground-inactive;
      }

      #workspaces button.active {
          background-color: @background-alt;
          border-radius: 3px;
      }

      #wireplumber,
      #pulseaudio,
      #bat,
      #tray,
      #usage,
      #net {
          background-color: @background-alt;
          border-radius: 3px;
          padding-left: 0.5em;
          padding-right: 0.5em;
          margin-left: 0.3em;
      }

      #battery,
      #memory,
      #language,
      #network {
          margin-right: 0.8em;
      }

      #custom-power {
        background-color: transparent;
        color: #fefcfd;
        font-weight: bold;
        font-size: 12px;
        margin-right: 10px;
        margin-left: 10px;
        transition: background-color 0.3s ease;
        }
    '';
  };
}
