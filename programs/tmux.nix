{ config, pkgs, ... }:
{
  programs.tmux = {
      enable = true;
      prefix = "C-a";
      mouse = true;
      plugins = [
        pkgs.tmuxPlugins.battery
        {
          plugin = pkgs.tmuxPlugins.catppuccin;
          extraConfig = ''
            set -g @catppuccin_window_left_separator ""
            set -g @catppuccin_window_right_separator "█"
            set -g @catppuccin_window_number_position "right"
            set -g @catppuccin_window_middle_separator "  █"

            set -g @catppuccin_window_default_fill "number"

            set -g @catppuccin_window_current_fill "number"
            set -g @catppuccin_window_current_text "#{pane_current_path}"

            set -g @catppuccin_status_modules_right "session date_time"
            set -g @catppuccin_status_left_separator  ""
            set -g @catppuccin_status_right_separator " "
            set -g @catppuccin_status_right_separator_inverse "yes"
            set -g @catppuccin_status_fill "all"
            set -g @catppuccin_status_connect_separator "no"
          '';
        }
        pkgs.tmuxPlugins.vim-tmux-navigator
        pkgs.tmuxPlugins.sensible
      ];
      extraConfig = ''
        set-option -ga terminal-overrides ",xterm-256color:Tc"
        set-option -g status-position top

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
