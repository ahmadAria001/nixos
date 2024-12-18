{ pkgs, ... }:
{
	programs.kitty = {
		enable = true;
		font = {
			name = "JetBrainsMono Nerd Font";
			size = 10;
		};
		themeFile = "tokyo_night_moon";
		settings = {
			scrollback_lines = 10000;
			enable_audio_bell = false;
			update_check_interval = 0;
			themeFile = "";
			background_opacity = 0.7;
			font_size = 10.0;
			tab_bar_edge = "bottom";
			tab_bar_style = "powerline";
			tab_separator = " ┇";
			tab_powerline_style = "round";
			notify_on_cmd_finish = ''invisible 10.0 command notify-send "job finished with status: %s" %c'';
		};
		keybindings = {
			"ctrl+shift+home" = "scroll_home";
			"ctrl+shift+end" = "scroll_end";
			"ctrl+shift+right" = "next_tab";
			"ctrl+shift+left" = "previous_tab";
		};
		shellIntegration = {
			mode = "no-rc";
			enableZshIntegration = true;
		};
	};
}
