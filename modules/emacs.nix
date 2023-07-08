{ pkgs, inputs, ... }:

{
  config = {
    nixpkgs.overlays = [ (import inputs.emacs-overlay) ];


  };
}
