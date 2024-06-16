{ config, pkgs, ... }:
{
  programs.tmux = {
      enable = true;
      prefix = "C-a";
      mouse = true;
      plugins = with pkgs.tmuxPlugins; [
        vim-tmux-navigator
        sensible
        catppuccin
      ];
    };
}
