{
  inputs =
    {
      nixpkgs.url = "nixpkgs/nixos-unstable";
      nur.url = "github:nix-community/NUR";
      nixos-hardware.url = "github:nixos/nixos-hardware";

      nix-darwin = {
        url = "github:LnL7/nix-darwin";
        inputs.nixpkgs.follows = "nixpkgs";
      };

      emacs-overlay = {
        url = "github:nix-community/emacs-overlay";
        inputs.nixpkgs.follows = "nixpkgs";
      };

      home-manager = {
        url = "github:nix-community/home-manager/master";
        inputs.nixpkgs.follows = "nixpkgs";
      };

      pre-commit-hooks = {
        url = "github:cachix/pre-commit-hooks.nix";
        inputs.nixpkgs-stable.follows = "nixpkgs";
        inputs.nixpkgs.follows = "nixpkgs";
      };

      # helix = {
      #   url = "github:helix-editor/helix?ref=23.10";
      #   inputs.nixpkgs.follows = "nixpkgs";
      # };

      kmonad = {
        url = "github:kmonad/kmonad?dir=nix";
        inputs.nixpkgs.follows = "nixpkgs";
      };
    };

  outputs = inputs @ { self, nixpkgs, nix-darwin, pre-commit-hooks, ... }:
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

      darwinConfigurations = {
        "pagan" = nix-darwin.lib.darwinSystem {
          modules = [ ./hosts/pagan ];
          specialArgs = { inherit inputs; };
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

  nixConfig = {
    extra-substituters = [
      "https://nix-community.cachix.org"
      # "https://helix.cachix.org"
    ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      # "helix.cachix.org-1:ejp9KQpR1FBI2onstMQ34yogDm4OgU2ru6lIwPvuCVs="
    ];
  };
}
