{
  self,
  pkgs,
  lib,
  nixvim,
  xdg,
  helpers,
  ...
}: {
  imports = [
    ./autoCmd.nix
    ./keymap.nix
    ./plugins.nix
    ./colorschemes.nix
    ./options.nix
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    #vimdiffAlias = true;
    globals.mapleader = " ";

    opts = {
      shiftwidth = 2;
      number = true;
      relativenumber = false;

      autoindent = true;
      autoread = true;
    };

    withNodeJs = true;
    withRuby = true;
  };
}
