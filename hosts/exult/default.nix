{ config, pkgs, lib, ... }:

{
  imports = [
    ../configuration.nix
    ./hardware-configuration.nix
  ];

  time.timeZone = "Pacific/Auckland";

  networking = {
    hostName = "exult";
    hostId = "06b7bfc8";
  };
}
