{ pkgs, ... }:
{
	programs.eza = {
		enable = true;
		git = true;
		icons = true;
		extraOptions = [
			  "--group-directories-first"
			  "--header"
		];
		enableZshIntegration = true;
	};
}
