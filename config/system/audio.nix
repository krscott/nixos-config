{ pkgs, config, lib, ... }:

let
  inherit (import ../../options.nix) audio;
in
{
  pipewire = {
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };
    hardware.pulseaudio.enable = false;
  };

  pulseaudio = {
    hardware.pulseaudio = {
      enable = true;
      support32Bit = true;
    };
  };
}.${audio}

