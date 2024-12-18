{
  pkgs,
  lib,
  spicetify-nix,
  ...
}: let
    spicePkgs = spicetify-nix.legacyPackages.${pkgs.system};
in {
  # allow spotify to be installed if you don't have unfree enabled already
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "spotify"
    ];

  # import the flake's module for your system
  imports = [
    spicetify-nix.nixosModules.default
  ];

  # configure spicetify :)
  programs.spicetify = let
  in {
    spotifyPackage = pkgs.spotify;

    enable = true;
    theme = spicePkgs.themes.comfy;
    colorScheme = "catppuccin-latte";

    enabledCustomApps = with spicePkgs.apps; [
      newReleases
      marketplace
      lyricsPlus
      reddit
      ncsVisualizer
      historyInSidebar
      betterLibrary
    ];

    enabledExtensions = with spicePkgs.extensions; [
      fullAppDisplay
      shuffle
      hidePodcasts
      adblockify
      volumePercentage
      history
      copyToClipboard
      showQueueDuration
      songStats
      copyLyrics
      beautifulLyrics
      trashbin
    ];
  };
}
