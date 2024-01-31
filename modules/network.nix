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

    wireless = mkOption {
      type = types.str;
      default = "wlp3s0";
    };

    ethernet = mkOption {
      type = types.str;
      default = "enp5s0";
    };
  };

  config = mkIf cfg.enable {
    boot = {
      kernelModules = [ "tcp_bbr" ];

      kernel.sysctl = {
        # # Enable IP forwarding.
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

      # # Enable antenna aggregation
      # # options iwlwifi 11n_disable=8
      # extraModprobeConfig = ''
      #   options iwlwifi disable_11ax=Y
      #   options iwlwifi 11n_disable=8
      #   options iwlmvm power_scheme=1
      # '';
    };

    networking = {
      wireless.enable = false;

      networkmanager = {
        enable = true;
        ethernet.macAddress = "random";
        wifi.macAddress = "random";
        insertNameservers = [ "1.1.1.1" "9.9.9.9" ];
      };

      search = [ ];

      # defaultGateway = "192.168.1.1";

      firewall = mkIf cfg.forward {
        enable = true;
        extraCommands = ''
          iptables -t nat -A POSTROUTING -o ${cfg.wireless} -j MASQUERADE
          iptables -I FORWARD -o ${cfg.wireless} -s 192.168.0.0/16 -j ACCEPT
          iptables -I INPUT -s 192.168.0.0/16 -j ACCEPT
        '';
        extraStopCommands = ''
          iptables -t nat -D POSTROUTING -o ${cfg.wireless} -j MASQUERADE || true
          iptables -D FORWARD -o ${cfg.wireless} -s 192.168.0.0/16 -j ACCEPT || true
          iptables -D INPUT -s 192.168.0.0/16 -j ACCEPT || true
        '';
      };

      interfaces.${cfg.ethernet}.ipv4.addresses = [
        {
          address = "192.168.1.200";
          prefixLength = 24;
        }
      ];
    };
  };
}
