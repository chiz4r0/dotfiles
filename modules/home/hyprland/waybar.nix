{ inputs, pkgs, ... }:
{
  programs.waybar = {
    enable = true;
    settings = [{
      height = 30;
      spacing = 4;

      modules-left = [
        "hyprland/workspaces"
        "hyprland/window"
      ];

      "hyprland/window" = {
        format = " -$> {title}";
        format-empty = "Welcome";
        max-length = 50;
        icon = true;
        icon-size = 16;
        separate-outputs = true;
      };

      modules-right = [
        "pulseaudio"
        "network"
        "cpu"
        "memory"
        "temperature"
        "backlight"
        "battery"
        "clock"
        "tray"
        "custom/power"
      ];

      "hyprland/workspaces" = {
        disable-scroll = false;
        all-outputs = true;
        persistent-workspaces = {
          "*" = [ 1 2 3 4 5 ];
        };
      };

      "keyboard-state" = {
        numlock = true;
        capslock = true;
        format = "{name} {icon}";
        format-icons = {
          locked = "";
          unlocked = "";
        };
      };

      mpd = {
        format = "{stateIcon} {consumeIcon}{randomIcon}{repeatIcon}{singleIcon}{artist} - {album} - {title} ({elapsedTime:%M:%S}/{totalTime:%M:%S}) ⸨{songPosition}|{queueLength}⸩ {volume}% ";
        format-disconnected = "Disconnected ";
        format-stopped = "{consumeIcon}{randomIcon}{repeatIcon}{singleIcon}Stopped ";
        unknown-tag = "N/A";
        interval = 5;
        consume-icons = {
          on = " ";
        };
        random-icons = {
          off = "<span color=\"#f53c3c\"></span> ";
          on = " ";
        };
        repeat-icons = {
          on = " ";
        };
        single-icons = {
          on = "1 ";
        };
        state-icons = {
          paused = "";
          playing = "";
        };
        tooltip-format = "MPD (connected)";
        tooltip-format-disconnected = "MPD (disconnected)";
      };

      idle_inhibitor = {
        format = "{icon}";
        format-icons = {
          activated = "";
          deactivated = "";
        };
      };

      tray = {
        spacing = 10;
      };

      clock = {
        tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        format-alt = "{:%Y-%m-%d}";
      };

      cpu = {
        format = "{usage}% ";
        tooltip = false;
      };

      memory = {
        format = "{}% ";
      };

      temperature = {
        critical-threshold = 80;
        format = "{temperatureC}°C {icon}";
        format-icons = [ "" "" "" ];
      };

      backlight = {
        format = "{percent}% {icon}";
        format-icons = [ "" "" "" "" "" "" "" "" "" ];
      };

      battery = {
        states = {
          warning = 30;
          critical = 15;
        };
        format = "{capacity}% {icon}";
        format-full = "{capacity}% {icon}";
        format-charging = "{capacity}% ";
        format-plugged = "{capacity}% ";
        format-alt = "{time} {icon}";
        format-icons = [ "" "" "" "" "" ];
      };

      "battery#bat2" = {
        bat = "BAT2";
      };

      "power-profiles-daemon" = {
        format = "{icon}";
        tooltip-format = "Power profile: {profile}\nDriver: {driver}";
        tooltip = true;
        format-icons = {
          default = "";
          performance = "";
          balanced = "";
          power-saver = "";
        };
      };

      network = {
        format-wifi = "{essid} ({signalStrength}%) ";
        format-ethernet = "{ipaddr}/{cidr} ";
        tooltip-format = "{ifname} via {gwaddr} ";
        format-linked = "{ifname} (No IP) ";
        format-disconnected = "Disconnected ⚠";
        format-alt = "{ifname}: {ipaddr}/{cidr}";
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
    }];
    style = ''
        /*
        * Waybar Style Sheet
        * FontAwesome icons require `otf-font-awesome` to be installed.
        * This stylesheet is tailored for clarity, performance, and modularity.
        */

        /* GLOBAL RESET & BASE */
        * {
            border-radius: 4px;
            font-family: FontAwesome, "Adwaita Mono", Helvetica, Arial, sans-serif;
            font-weight: bold;
            font-size: 12px;
        }

        /* Hyprland Window Title */
        #window {
            background-color: #061b25;
            color: #e0e0e0;
            padding: 0 12px;
            margin: 4px 2px;
            font-style: italic;
        }



        /* GLOBAL WINDOW STYLES */
        window#waybar {
            background-color: rgba(1, 17, 33, 0.6);
            color: #ffffff;
            border-bottom: 1px solid rgba(100, 114, 125, 0.5);
            transition: background-color 0.5s ease;
            border-radius: 0;
        }

        window#waybar.hidden {
            opacity: 0.2;
        }

        /* Optional themes for window matching specific app classes */
        window#waybar.termite {
            background-color: #3F3F3F;
        }

        window#waybar.chromium {
            background-color: #000000;
            border: none;
        }

        /* BUTTON STYLING */
        button {
            border: none;
            border-radius: 0;
            box-shadow: inset 0 -3px transparent;
            background: none;
            padding: 0;
            margin: 0 1px;
        }

        button:hover {
            background: inherit;
            box-shadow: inset 0 -3px #ffffff;
        }

        /* WORKSPACES */
        #workspaces {
            margin-right: 10px;
        }

        #workspaces button {
            padding: 0 0.2em;
            background-color: transparent;
            color: #ffffff;
        }

        #workspaces button:hover {
            background-color: rgba(0, 0, 0, 0.2);
        }

        #workspaces button.active {
            background-color: #64727D;
            box-shadow: inset 0 -3px #ffffff;
        }

        #workspaces button.urgent {
            background-color: #eb4d4b;
        }

        .modules-left > widget:first-child > #workspaces {
            margin-left: 0;
        }

        .modules-right > widget:last-child > #workspaces {
            margin-right: 0;
        }

        /* MODULE GENERAL LAYOUT */
        #clock,
        #battery,
        #cpu,
        #memory,
        #disk,
        #temperature,
        #backlight,
        #network,
        #pulseaudio,
        #wireplumber,
        #custom-media,
        #mode,
        #idle_inhibitor,
        #scratchpad,
        #power-profiles-daemon,
        #mpd,
        #language,
        #keyboard-state {
            padding: 0 10px;
            margin: 4px 1px;
            color: #333333;
        }

        /* PER-MODULE STYLING */

        /* Clock */
        #clock {
            background-color: #fefcfd;
        }

        /* Battery */
        #battery {
            background-color: #fefcfd;
        }
        #battery.charging,
        #battery.plugged {
            background-color: #26A65B;
            color: #ffffff;
        }
        #battery.critical:not(.charging) {
            background-color: #f53c3c;
            color: #ffffff;
            animation: blink 0.5s steps(12) infinite alternate;
        }

        /* CPU & Memory */
        #cpu, #memory {
            background-color: #fefcfd;
        }

        /* Disk */
        #disk {
            background-color: #964B00;
            color: #ffffff;
        }

        /* Network */
        #network {
            background-color: #fefcfd;
        }
        #network.disconnected {
            background-color: #f53c3c;
        }

        /* Audio */
        #pulseaudio,
        #wireplumber {
            background-color: #fefcfd;
            color: #333333;
        }
        #pulseaudio.muted,
        #wireplumber.muted {
            color: #fefcfd;
        }

        /* Temperature */
        #temperature {
            background-color: #fefcfd;
        }
        #temperature.critical {
            background-color: #eb4d4b;
        }

        /* Backlight */
        #backlight {
            background-color: #fefcfd;
        }

        /* Idle Inhibitor */
        #idle_inhibitor {
            background-color: #fefcfd;
        }
        #idle_inhibitor.activated {
            background-color: #ecf0f1;
            color: #2d3436;
        }

        /* Power Profiles */
        #power-profiles-daemon {
            padding-right: 15px;
        }
        #power-profiles-daemon.performance {
            background-color: #f53c3c;
            color: #ffffff;
        }
        #power-profiles-daemon.balanced {
            background-color: #2980b9;
            color: #ffffff;
        }
        #power-profiles-daemon.power-saver {
            background-color: #2ecc71;
            color: #000000;
        }



        /* Tray Icons */
        #tray {
            background-color: transparent;
        }
        #tray > .passive {
            -gtk-icon-effect: dim;
        }
        #tray > .needs-attention {
            background-color: transparent;
            -gtk-icon-effect: highlight;
        }

        #custom-power {
            background-color: transparent;
            color: #fefcfd;
            font-weight: bold;
            font-size: 18px;
            margin-right: 10px;
            margin-left: 10px;
            transition: background-color 0.3s ease;
        }

        /* Language Switcher */
        #language {
            background: #00b093;
            color: #740864;
            padding: 0 5px;
            margin: 0 5px;
            min-width: 16px;
        }

        /* Keyboard State */
        #keyboard-state {
            background-color: #fefcfd;
            color: #333333;
            padding: 0;
            margin: 6px 3px;
            min-width: 16px;
        }
        #keyboard-state > label {
            padding: 0 5px;
        }
        #keyboard-state > label.locked {
            background-color: rgba(0, 0, 0, 0.2);
        }

        /* Scratchpad */
        #scratchpad {
            background-color: rgba(0, 0, 0, 0.2);
        }
        #scratchpad.empty {
            background-color: transparent;
        }

        /* Privacy Indicator */
        #privacy {
            padding: 0;
        }
        #privacy-item {
            padding: 0 5px;
            color: white;
        }
        #privacy-item.screenshare {
            background-color: #cf5700;
        }
        #privacy-item.audio-in {
            background-color: #1ca000;
        }
        #privacy-item.audio-out {
            background-color: #0069d4;
        }

        /* Mode Module */
        #mode {
            background-color: #64727D;
            box-shadow: inset 0 -3px #ffffff;
        }

        /* Focused Label */
        label:focus {
            background-color: #000000;
        }

        /* ANIMATIONS */
        @keyframes blink {
            to {
                background-color: #ffffff;
                color: #000000;
            }
        }

    '';
  };

}