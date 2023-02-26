# Enable the OpenSSH daemon.
services.openssh.enable = true;
networking.firewall.enable = true;

# Open ports in the firewall.
networking.firewall.allowedTCPPorts = [ ];
networking.firewall.allowedUDPPorts = [ ];
