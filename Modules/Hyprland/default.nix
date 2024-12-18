{ pkgs, inputs, ... }: 
{
  environment.systemPackages = with pkgs; [
    kitty
    libnotify
    ags
    pywal
    wl-clipboard
    inputs.hyprpanel.packages.${pkgs.system}.default
    grimblast
    slurp
    hyprpicker
    matugen
    dart-sass
    brightnessctl
    pyprland
  ];

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    portalPackage = pkgs.xdg-desktop-portal-hyprland;
  };

  programs.yubikey-touch-detector = {
  	enable = true;
	libnotify = true;
  };
}

