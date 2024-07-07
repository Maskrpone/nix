{config, lib, pkgs, ...}:
{
  home.file.waybar = {
    recursive = true;
    source = ../dotfiles/waybar;
    target = "./.config/waybar";
  };
}
