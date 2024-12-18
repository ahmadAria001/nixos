{ config, pkgs, ... }:

{
  home = {
    username = "tereza";
    homeDirectory = "/home/tereza";
    stateVersion = "24.05";
  };

  imports = [
    ./modules
  ];

  # link the configuration file in current directory to the specified location in home directory
  # home.file.".config/i3/wallpaper.jpg".source = ./wallpaper.jpg;

  # link all files in `./scripts` to `~/.config/i3/scripts`
  # home.file.".config/i3/scripts" = {
  #   source = ./scripts;
  #   recursive = true;   # link recursively
  #   executable = true;  # make all files executable
  # };

  # encode the file content in nix configuration file directly
  # home.file.".xxx".text = ''
  #     xxx
  # '';

  # set cursor size and dpi for 4k monitor
  xresources.properties = {
    "Xcursor.size" = 16;
    "Xft.dpi" = 172;
  };

  home.packages = with pkgs; [
  	postman
	httpie-desktop
  ];

  services = {
    wlsunset = {
      enable = true;
      latitude = -8.010376;
      longitude = 112.706032;
    };
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    fileWidgetOptions = [
        "--preview 'head {}'"
    ];
    fileWidgetCommand = "fd --type f";
    defaultCommand = "fd --type f";
  };

  programs.git = {
    enable = true;
    userName = "ahmadAria001";
    userEmail = "ahmadaria012@gmail.com";
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;
      plugins = [ 
	"git" 
	"thefuck" 
	"fzf" 
	"flutter" 
	"laravel" 
      ];
      theme = "robbyrussell";
    };
    shellAliases = {
      ll = "ls -l";
      update = "sudo nixos-rebuild switch";
    };
    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };
    
    initExtra = ''
      wal -i ~/.config/background -i 0.1 -q &&
      print -P "%F{#00ff84}┌────────────────────────────────── %F{#ff0062}Welcome %F{#00ff84}──────────────────────────────────┐"
      print -P '	%F{green}  ______  %F{red}  ______   %F{#00faa2}   ______   %F{#ff006a}   ______   %F{#ff006a}  ______   %F{#8000ff}   ______' &&
      print -P '	%F{green} /\\__  _\\ %F{red} /\\  ___\\  %F{#00faa2}  /\\  == \\  %F{#ff006a}  /\\  ___\\  %F{#ff006a} /\\___  \\  %F{#8000ff}  /\\  __ \\' &&
      print -P '	%F{green} \\/_/\\ \\/ %F{red} \\ \\  __\\  %F{#00faa2}  \\ \\  __<  %F{#ff006a}  \\ \\  __\\  %F{#ff006a} \\/_/  /__ %F{#8000ff}  \\ \\  __ \\' &&
      print -P '	%F{green}    \\ \\_\\ %F{red}  \\ \\_____\\%F{#00faa2}   \\ \\_\\ \\_\\%F{#ff006a}   \\ \\_____\\%F{#ff006a}   /\\_____\\%F{#8000ff}   \\ \\_\\ \\_\\' &&
      print -P '	%F{green}     \\/_/ %F{red}   \\/_____\/%F{#00faa2}    \\/_/ /_/%F{#ff006a}    \\/_____/%F{#ff006a}   \\/_____/%F{#8000ff}    \\/_/\\\/_/' &&
      print -P "%F{#00ff84}└──────────────────────────────────────────────────────────────────────────────┘" &&
      '';
  };


  # starship - an customizable prompt for any shell
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      add_newline = false;
      aws.disabled = true;
      gcloud.disabled = true;
      line_break.disabled = true;
    };
  };

  programs.home-manager.enable = true;
}
