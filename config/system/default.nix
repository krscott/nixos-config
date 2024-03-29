{ config, pkgs, ... }:

{
  imports = [
    # Standard ZaneyOS imports
    ./amd-gpu.nix
    ./appimages.nix
    ./autorun.nix
    ./boot.nix
    ./displaymanager.nix
    ./flatpak.nix
    ./hwclock.nix
    ./intel-amd.nix
    ./intel-gpu.nix
    ./intel-nvidia.nix
    ./kernel.nix
    ./logitech.nix
    ./neovim.nix
    ./nfs.nix
    ./ntp.nix
    ./nvidia.nix
    ./packages.nix
    ./polkit.nix
    ./python.nix
    ./printer.nix
    ./services.nix
    ./steam.nix
    ./vm.nix

    # Extra imports
    ./audio.nix
  ];
}
