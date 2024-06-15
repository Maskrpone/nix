{ config, pkgs, inputs, ... }:
{
	imports = [ 
		./programs 
	];

	home.username = "maskrpone";
	home.homeDirectory = "/home/maskrpone";

	nixpkgs.config = {
		allowUnfree = true;
		allowBroken = true;
	};

	home.packages = [
		pkgs.eza
		pkgs.btop
		pkgs.gnome.nautilus
		pkgs.thefuck
		pkgs.fzf
		pkgs.bitwarden
		# (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })
	];


	home.file = {
		alacritty = {
			recursive = true;
			source = ./dotfiles/alacritty;
			target = "./.config/alacritty";
		};
		# # Building this configuration will create a copy of 'dotfiles/screenrc' in
		# # the Nix store. Activating the configuration will then make '~/.screenrc' a
		# # symlink to the Nix store copy.
		# ".screenrc".source = dotfiles/screenrc;

		# # You can also set the file content immediately.
		# ".gradle/gradle.properties".text = ''
		#   org.gradle.console=verbose
		#   org.gradle.daemon.idletimeout=3600000
		# '';
	};

	home.sessionVariables = {
		EDITOR = "nvim";
	};

	home.stateVersion = "24.05"; # Please read the comment before changing.
	programs.home-manager.enable = true;
}
