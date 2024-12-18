{
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    droidcam
  ];

  programs.droidcam = {
    enable = true;
  };
}
