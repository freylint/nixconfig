{ environment, config, pkgs, inputs, ... }: let
  inherit (inputs) home-manager;
in {
  # TODO make cosmic-files the default file manager
  environment.systemPackages = with pkgs; [
    swaylock
    swayidle
    grim
    wl-clipboard

    cosmic-term
    cosmic-files

    wofi
    wdisplays

    gnome3.adwaita-icon-theme
    helvum

    dbus
    glib
    xdg-utils
  ];

  services = {
    dbus.enable = true;
    greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --remember --cmd wayfire";
          user = "gen";
        };
      };
    };
    xserver = {
      enable = true;
      desktopManager = {
        xterm.enable = false;
      };
    };
  };

  programs = {
    wayfire = {
      enable = true;
      plugins = with pkgs.wayfirePlugins; [
        wcm
        wf-shell
        wayfire-plugins-extra
      ];
    };
  };

  # Prevent greetd from spamming dmesg
  systemd.services.greetd.serviceConfig = {
    Type = "idle";
    StandardInput = "tty";
    StandardOutput = "tty";
    StandardError = "journal";
    TTYReset = true;
    TTYVHangup = true;
    TTYVTDisallocate = true;
  };

  security.pam = { 
    services.swaylock = {};
    loginLimits = [
      { domain = "@users"; item = "rtprio"; type = "-"; value = 1; }
    ];
  };


}
