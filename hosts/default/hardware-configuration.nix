# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "nvme" "ahci" "usbhid" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/bd9c2fdc-e0e0-4794-a151-1ebda5a862a8";
      fsType = "ext4";
    };

  boot.initrd.luks.devices."root".device = "/dev/disk/by-uuid/4e844d9e-27e6-443a-be06-4fa814a3b362";

  fileSystems."/var/lib/docker" =
    { device = "/dev/disk/by-uuid/0583408f-80e5-4422-bbee-5eb4b7b05a6f";
      fsType = "ext4";
    };

  boot.initrd.luks.devices."docker".device = "/dev/disk/by-uuid/9dffcbd8-8a4f-4a7e-a08f-998c1d6658a8";

  fileSystems."/home" =
    { device = "/dev/disk/by-uuid/dc7084fd-7bdb-4df5-87e3-3ec3f260abfc";
      fsType = "ext4";
    };

  boot.initrd.luks.devices."home".device = "/dev/disk/by-uuid/28b8748d-dd15-4bf9-be66-2718d331c69c";

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/0B95-6E29";
      fsType = "vfat";
    };

  swapDevices = [ ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.eno1.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp4s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
