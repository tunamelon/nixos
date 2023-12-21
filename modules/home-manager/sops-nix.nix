{ config, pkgs, ... }:

{
  sops = {
    age = {
      # age key
      keyFile = "~/.config/sops/age/keys.txt"; # Path to your age key file, must have no password
      # can also use ssh key with no password
      # sshKeyPaths = [ "~/.ssh/id_ed25519_nixos" ]; # Path to your SSH private key, must have no password
    };
    defaultSopsFile = ~/nixos/secrets/secrets.yaml; # Path to your default sops file
    secrets = {
      test = {
        sopsFile = ./secrets.yaml; # Optional, define per-secret file if different from default
        path = "%r/test.txt"; # Path where the secret will be decrypted
        # %r will be replaced with the appropriate runtime directory
      };
      # Define other secrets as needed
    };
  };
}
