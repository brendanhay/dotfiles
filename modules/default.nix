{ ... }:

{
  imports = [
    ./alacritty.nix
    ./borgmatic.nix
    ./direnv.nix
    ./dropbox.nix
    ./emacs.nix
    ./firefox.nix
    ./fonts.nix
    ./git.nix
    ./gpg.nix
    ./gtk.nix
    ./mime.nix
    ./readline.nix
    ./systemd.nix
    ./sway.nix
    ./rofi.nix
    ./user.nix
    ./vim.nix
    ./waybar.nix
    ./zsh.nix

    ./hardware/amdgpu.nix
    ./hardware/audio.nix
    ./hardware/filesystem.nix
  ];
}
