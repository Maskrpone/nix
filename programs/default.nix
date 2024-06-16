{config, pkgs, ... }:
{
	imports = [
		./sh.nix
		./alacritty.nix
		./ags.nix
    ./tmux.nix
	];
}
