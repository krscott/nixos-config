# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, username, ... }:

{
  imports =
    [
      (modulesPath + "/installer/scan/not-detected.nix")
      ./config/system/persistence.nix
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ehci_pci" "nvme" "usbhid" "uas" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    {
      device = "none";
      fsType = "tmpfs";
      options = [ "defaults" "size=35%" "mode=755" ];
    };

  fileSystems."/boot" =
    {
      device = "/dev/disk/by-uuid/CF00-A288";
      fsType = "vfat";
      options = [ "umask=0077" ];
    };

  fileSystems."/nix" =
    {
      device = "/dev/disk/by-uuid/86765b18-75f6-4900-809a-2931a8dac75e";
      fsType = "ext4";
    };

  boot.initrd.luks.devices."crypted".device = "/dev/disk/by-uuid/1a35e8d0-f13c-43f3-8c12-3aaa5059c8a3";

  fileSystems."/etc/nixos" =
    {
      device = "/nix/persist/etc/nixos";
      fsType = "none";
      options = [ "bind" ];
    };

  fileSystems."/home/${username}/zaneyos" =
    {
      device = "/nix/persist/etc/nixos/zaneyos";
      fsType = "none";
      options = [ "bind" ];
    };

  fileSystems."/var/log" =
    {
      device = "/nix/persist/var/log";
      fsType = "none";
      options = [ "bind" ];
    };

  swapDevices =
    [{
      device = "/dev/disk/by-partuuid/b77747cb-7eb5-4d78-bb6a-34ded8eb7c23";
      randomEncryption.enable = true;
    }];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp7s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
