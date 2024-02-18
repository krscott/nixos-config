# Based on https://www.youtube.com/watch?v=srEpeCqM-Qk
{ inputs, config, pkgs, ... }:
{
  # Use cached build (Not me, I got 32 threads)
  # nix.settings = {
  #   substituters = ["https://hyprland.cachix.org"];
  #   trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  # };

  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
  };

  # tuigreet: https://github.com/apognu/tuigreet
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland";
        user = "greeter";
      };
    };
  };

  environment.systemPackages = with pkgs; [
    hyprpaper
    kitty
    rofi-wayland
    waybar
    gnome-icon-theme
  ];

}