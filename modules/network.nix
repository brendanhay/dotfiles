{ config, pkgs, lib, ... }:

with lib;

let
  cfg = config.modules.network;
in
{
  options.modules.network = {
    enable = mkOption {
      type = types.bool;
      default = false;
    };

    forward = mkOption {
      type = types.bool;
      default = false;
    };
  };

  config = mkIf cfg.enable {
    boot = {
      kernelModules = [ "tcp_bbr" ];
      kernel.sysctl = {
        # Enable IP forwarding.
        "net.ip4_ip_forward" = mkIf cfg.forward 1;

        # TCP Fast Open is a TCP extension that reduces network latency by packing
        # data in the sender’s initial TCP SYN. Setting 3 = enable TCP Fast Open for
        # both incoming and outgoing connections:
        "net.ipv4.tcp_fastopen" = 3;
        #
        # Bufferbloat mitigations + slight improvement in throughput & latency.
        "net.ipv4.tcp_congestion_control" = "bbr";
        "net.core.default_qdisc" = "cake";
      };
    };

    networking.firewall = mkIf cfg.forward {
      enable = true;
      extraCommands = ''
        iptables -t nat -A POSTROUTING -o wlp3s0 -j MASQUERADE
        iptables -I FORWARD -o wlp3s0 -s 10.0.0.0/16 -j ACCEPT
        iptables -I INPUT -s 10.0.0.0/16 -j ACCEPT
      '';
      extraStopCommands = ''
        iptables -D FORWARD -o wlp3s0 -s 10.0.0.0/16 -j ACCEPT || true
        iptables -D INPUT -s 10.0.0.0/16 -j ACCEPT || true
      '';
    };

    networking.interfaces."enp5s0".ipv4.addresses = [
      {
        address = "10.0.0.1";
        prefixLength = 24;
      }
    ];
  };
}
