{
  description = "brendanhay's dotfiles";

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
