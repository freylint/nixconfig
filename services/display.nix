{ services, environment, ... }:
{
  # Enable the X11 windowing system.
  services.xserver.enable = true;
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
