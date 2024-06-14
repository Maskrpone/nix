{ config, lib, pkgs, ... }:
{
	programs.alacritty = {
		enable = true;
		settings = {
			import = [ "~/.nix/extras/onedark.toml" ];

			env.TERM = "xterm-256color";

			window = {
				opacity = 1;
				padding = {
					x = 20;
					y = 20;
				};
				decorations = "None";
			};

			font = {
				normal = {
					family = "Hack Nerd Font Mono";
					style = "Regular";
				};
				bold = {
					family = "Hack Nerd Font Mono";
					style = "Bold";
				};
				italic = {
					family = "Hack Nerd Font Mono";
					style = "Italic";
				};
				bold_italic = {
					family = "Hack Nerd Font Mono";
					style = "Bold Italic";
				};
				size = 16;
			};
		};
	};
}
