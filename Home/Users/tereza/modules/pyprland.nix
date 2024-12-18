{
  config,
  pkgs,
  lib,
  ...
}:
{
  home.packages = with pkgs; [
    pyprland
  ];

  xdg.configFile = {

    "hypr/pyprland.toml".text = ''
	[pyprland]
	plugins = [ "expose", "scratchpads" ]

	[expose]
	include_special = false

	[scratchpads.term]
	animation = "fromTop"
	command = "kitty --class terminal-workspace-scratchpads"
	class = "terminal-workspace-scratchpads"
	size = "100% 70%"
	max_size = "90% 40%"
	position = "5% 5%"
	margin = 10
	multi = true
	allow_special_workspaces = true

	[scratchpads.ranger]
	animation = "fromRight"
	command = "kitty --class ranger-workspace-scratchpads yazi"
	class = "ranger-workspace-scratchpads"
	size = "50% 50%"
	max_size = "45% 45%"
	position = "51% 50%"
	margin = 10
	multi = true
	allow_special_workspaces = true

	[scratchpads.spotify]
	animation = "fromLeft"
	command = "spotify"
	class = "Spotify"
	size = "50% 50%"
	max_size = "45% 45%"
	position = "5% 50%"
	margin = 10
	multi = true
	allow_special_workspaces = true

	[scratchpads.volume]
	animation = "fromRight"
	command = "pavucontrol"
	class = "org.pulseaudio.pavucontrol"
	size = "40% 90%"
	unfocus = "hide"
	lazy = true
	multi = false
      '';
  };
}
