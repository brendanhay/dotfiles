{ ... }:

{
  imports = [
    ./alacritty.nix
    ./autoupgrade.nix
    ./borgmatic.nix
    ./clamav.nix
    ./direnv.nix
    ./docker.nix
    ./dropbox.nix
    ./emacs.nix
    ./firefox.nix
    ./fonts.nix
    ./git.nix
    ./gpg.nix
    ./gtk.nix
    ./helix.nix
    ./kanshi.nix
    ./kmonad.nix
    ./mime.nix
    ./mold.nix
    ./network.nix
    ./readline.nix
    ./rofi.nix
    ./steam.nix
    ./sway.nix
    ./swaylock.nix
    ./systemd.nix
    ./tailscale.nix
    ./user.nix
    ./vim.nix
    ./waybar.nix
    ./wezterm.nix
    ./zsh.nix

    ./hardware/amdgpu.nix
    ./hardware/audio.nix
    ./hardware/filesystem.nix
    ./hardware/power.nix
  ];
}
