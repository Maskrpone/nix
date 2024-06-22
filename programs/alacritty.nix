{ config, lib, pkgs, ... }:
{
  home.file.alacritty = {
			recursive = true;
			source = ../dotfiles/alacritty;
      target = "./.config/alacritty";
    };
}
