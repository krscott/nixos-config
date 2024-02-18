{ pkgs, lib, inputs, ... }:
let
  startupScript = pkgs.pkgs.writeShellScriptBin "start" ''
    ${pkgs.waybar}/bin/waybar &
    ${pkgs.swww}/bin/swww init &
  '';
    #sleep 1
    #${pkgs.swww}/bin/swww img ${./wallpaper.png} &
in
{
  home.packages = with pkgs; [
    #hyprpaper
    #kitty
    #rofi-wayland
    #waybar
    #gnome-icon-theme
  ];

  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      exec-once = ''${startupScript}/bin/start'';
    };
  };
}
