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
    pkgs.gcc
    pkgs.tree-sitter
    pkgs.nodejs
		# (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })
	];


	home.file = {
		hypr = {
			recursive = true;
			source = dotfiles/hypr;
			target = "./.config/hypr";
		};
		neovim = {
			recursive = true;
			source = dotfiles/nvim;
			target = "./.config/nvim";
		};
	};

	home.sessionVariables = {
		EDITOR = "nvim";
	};

	home.stateVersion = "24.05"; # Please read the comment before changing.
	programs.home-manager.enable = true;
}
