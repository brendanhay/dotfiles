{
  description = "brendanhay's dotfiles";

  nixConfig = {
    substituters = [
      "https://cache.nixos.org"
      "https://nix-community.cachix.org"
      "https://pre-commit-hooks.cachix.org"
    ];
    trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "pre-commit-hooks.cachix.org-1:Pkk3Panw5AW24TOv6kz3PvLhlH8puAsJTBbOPmBo7Rc="
    ];
  };

  inputs =
    {
      nixpkgs.url = "nixpkgs/nixos-23.05";
      nixpkgs-unstable.url = "nixpkgs/nixpkgs-unstable";
      nur.url = "github:nix-community/NUR";
      nixos-hardware.url = "github:nixos/nixos-hardware";
      emacs-overlay.url = "github:nix-community/emacs-overlay";

      home-manager = {
        url = "github:nix-community/home-manager/release-23.05";
        inputs.nixpkgs.follows = "nixpkgs";
      };

      pre-commit-hooks = {
        url = "github:cachix/pre-commit-hooks.nix";
        inputs.nixpkgs-stable.follows = "nixpkgs";
        inputs.nixpkgs.follows = "nixpkgs-unstable";
      };

      doomemacs = {
        url = "github:doomemacs/doomemacs";
        flake = false;
      };

      hosts-blocked = {
        url = "https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts";
        flake = false;
      };
    };

  outputs = inputs @ { self, nixpkgs, nixpkgs-unstable, pre-commit-hooks, ... }:
    let
      linux-amd64 = "x86_64-linux";
    in
    {
      nixosConfigurations = {
        "exult" = nixpkgs.lib.nixosSystem {
          system = linux-amd64;
          modules = [ ./hosts/exult ];
          specialArgs = { inherit inputs; username = "bren"; };
        };
      };

      devShell."${linux-amd64}" =
        let
          pkgs = nixpkgs.legacyPackages.${linux-amd64};
        in
        pkgs.mkShell {
          name = "brendanhay-dotfiles";
          nativeBuildInputs = with pkgs; [
            nixpkgs-fmt
          ];
          shellHook = self.checks.${linux-amd64}.pre-commit-check.shellHook;
        };

      checks."${linux-amd64}" = {
        pre-commit-check = pre-commit-hooks.lib.${linux-amd64}.run {
          src = ./.;
          hooks = {
            shellcheck.enable = true;
            shfmt.enable = true;
            nixpkgs-fmt.enable = true;
          };
        };
      };
    };
}
