{ ... }:

{
  imports = [
    ./emacs.nix
    ./firefox.nix
    ./fonts.nix
    ./sway.nix
    ./user.nix
    ./vim.nix

    ./hardware/amdgpu.nix
    ./hardware/audio.nix
    ./hardware/filesystem.nix
  ];
}
