{ config, pkgs, lib, ... }:

with lib;

let
	cfg = config.modules.borgmatic;
in
{
	options.modules.borgmatic = {
		enable = mkOption {
			type = types.bool;
			default = false;
		};
	};

	config = mkIf cfg.enable {
		environment.systemPackages = with pkgs; [
			borg
		];

		modules.home-manager = {
			services.borgmatic = {
				enable = true;
				frequency = "hourly";
			};

			programs.borgmatic = {
				enable = true;
				backups = {};
			};
		};
	};
}
