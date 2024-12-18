{self, pkgs, ...}: {
  programs.nixvim = {
    opts = {
      number = true;
      relativenumber = false;
      clipboard = {
	      providers = {
	      	wl-copy.enable = true;
	      };
      };

      shiftwidth = 2;
      undodir = "${builtins.getEnv "HOME"}/.config/nvim/.undo/";
      undofile = true;
    };
  };
}
