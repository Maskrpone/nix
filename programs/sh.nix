{config, pkgs, ... }: 
{
	programs.zsh = {
		enable = true;
		enableCompletion = true;
		autosuggestion.enable = true;
		syntaxHighlighting.enable = true;
		oh-my-zsh = {
			enable = true;
			plugins = [ "git" "thefuck" "z" "ripgrep" "man" "docker" "colored-man-pages" "fzf" ];
			theme = "";
		};
		shellAliases = {
			l  = "eza -l --icons --tree --level=1 --group-directories-first";
			l2 = "eza -l --icons --tree --level=2 --group-directories-first";
			la = "eza -l --icons --tree --level=1 --group-directories-first --all";
			lg = "eza -l --icons --tree --level=1 --group-directories-first | grep ";

			n = "nvim ";
			q = "exit";
		};
	};
	programs.starship.enable = true;
}
