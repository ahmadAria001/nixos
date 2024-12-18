{ ... }: 
let
	hyprland_config = ./../files/configs/hypr;
in
{
  xdg.configFile = {
    "hypr" = {
    	recursive = true;
    	source = "${hyprland_config}";
    };
  };
}
