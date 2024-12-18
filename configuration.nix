# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ nixpkgs, config, pkgs, lib, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./gpu/nvidia.nix
      ./networking.nix
    ];

  # Bootloader.
  #boot.loader.systemd-boot.enable = true;
  #boot.loader.efi.canTouchEfiVariables = true;
	boot.loader = {
		efi = {
			canTouchEfiVariables = true;
			efiSysMountPoint = "/boot"; # ← use the same mount point here.
		};
		grub = {
			enable = true;
			efiSupport = true;
			device = "nodev";
			useOSProber = true;
		};
	};

  networking.hostName = "terezaNix"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Virtualisation (Docker)
  virtualisation.docker.enable = true;
  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };

  # Set your time zone.
  time.timeZone = "Asia/Jakarta";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # UPower
  services.upower.enable = true;

  # Display Manager
  services.displayManager.sddm = {
  	enable = true;
	wayland.enable = true;
  };
  services.displayManager.defaultSession = "hyprland";

  # Enable the XFCE Desktop Environment.
  #services.xserver.displayManager.lightdm.enable = true;
  #services.xserver.desktopManager.xfce.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Locate THINGY
  services.locate = {
  	enable = true;
	localuser = null;
	package = pkgs.mlocate;
	interval = "hourly";
  };

  services.devmon.enable = true;
  services.gvfs.enable = true;
  services.udisks2.enable = true;

  # Enable sound with pipewire.
  hardware = {
  	pulseaudio.enable = false;
	bluetooth = {
		enable = true;
		powerOnBoot = true;
		settings = {
			General = {
				Experimental = true;
			};
		};
		
  	};
  };
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
	extraConfig.pipewire."92-low-latency" = {
	  context.properties = {
	    default.clock.rate = 48000;
	    default.clock.quantum = 32;
	    default.clock.min-quantum = 32;
	    default.clock.max-quantum = 32;
	  };
	};

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Nix Settings
  nix.settings = {
  	experimental-features = [ 
		"nix-command" 
		"flakes"
	];
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;
  services.udev.packages = [
    pkgs.android-udev-rules
  ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users = {
    defaultUserShell = pkgs.zsh;
    users = {
      tereza = {
	isNormalUser = true;
	description = "TereZa";
	extraGroups = [ 
		"networkmanager" 
		"wheel"
		"docker" 
		"kvm"
		"adbusers"
		"mlocate"
		"video"
	];
	packages = with pkgs; [
	#  thunderbird
	];
      };

      pkj = {
      	isNormalUser = true;
	description = "Praktikum Jaringan";
	extraGroups = [
		"networkmanager"
		"docker"
		"kvm"
		"mlocate"
	];
	packages = with pkgs;[

	];
      };
    };
  };

  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnfreePredicate = with lib.licenses; [
    "intelephense"
  ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment = {
  	systemPackages = with pkgs; [
		# General Thingy i guess
		git
		arch-install-scripts # Rest In Pepperoni
		xdg-desktop-portal 
		xdg-desktop-portal-gtk
		tree
		waybar
		nautilus
		libgtop
		rofi
		obsidian
		gtop
		fd
		brightnessctl
		zoxide
		docker-compose
		pavucontrol
		playerctl
		scrcpy
		filezilla
		google-chrome
		gvfs
		cliphist
		icon-library
		python312Packages.gpustat

		# JS/TS Thingy
		bun
		nodejs_20
		nodejs_18

		# PHP Thingy
		php83
		laravel
		blade-formatter

		# Desktop Thingy
		swww
		btop
		gpu-screen-recorder
		droidcam
		kdePackages.dolphin
		beekeeper-studio
		xfce.xfce4-power-manager
		libreoffice-qt6-fresh
		inputs.zen-browser.packages."${system}".specific

		# Network Thingy
		suricata
		evebox
	  ] ++ (with pkgs.php83Packages; [
	    composer
	    box
	    phan
	    uv
	    gd
	    zip
	  ]);
  };

  programs = {
    adb = {
    	enable = true;
    };
    thefuck = {
      enable = true;
      alias = "fuak";
    };
    zsh = {
      enable = true;
    };
    starship = {
    	enable = true;
	presets = [ "jetpack" ];
    };
    openvpn3 = {
    	enable = true;
    };
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
