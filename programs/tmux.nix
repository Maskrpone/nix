{ config, pkgs, ... }:
{
  programs.tmux = {
      enable = true;
      prefix = "C-a";
      mouse = true;
      plugins = [
        pkgs.tmuxPlugins.catppuccin
        pkgs.tmuxPlugins.vim-tmux-navigator
        pkgs.tmuxPlugins.sensible
      ];
      extraConfig = ''
        unbind %
        bind | split-window -h

        unbind '"'
        bind - split-window -v

        bind -r j resize-pane -D 5
        bind -r k resize-pane -U 5
        bind -r l resize-pane -R 5
        bind -r h resize-pane -L 5
        bind -r m resize-pane -Z
      '';
    };
}
