{ config, lib, pkgs, ... }:

{
  nixpkgs = {
    hostPlatform = "aarch64-darwin";
    config.allowUnfree = true;
    overlays = [
      inputs.nur.overlay
    ];
  };

  nix = {
    package = pkgs.nixFlakes;
  };
}
