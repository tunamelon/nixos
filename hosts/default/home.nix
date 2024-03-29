{ config, pkgs, lib, inputs, ... }:

{
#  imports = [
#    inputs.sops-nix.nixosModules.sops
#    <sops-nix/modules/home-manager/sops.nix>
#  ];
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "tuna";
  home.homeDirectory = "/home/tuna";

  # Sops
#  sops = {
#    age.keyFile = "~/.config/sops/age/.key.txt"; # must have no password!
    # It's also possible to use a ssh key, but only when it has no password:
    #age.sshKeyPaths = [ "/home/user/path-to-ssh-key" ];
#    defaultSopsFile = ./secrets.yaml;
#    secrets.test = {
      # sopsFile = ./secrets.yml.enc; # optionally define per-secret files

      # %r gets replaced with a runtime directory, use %% to specify a '%'
      # sign. Runtime dir is $XDG_RUNTIME_DIR on linux and $(getconf
      # DARWIN_USER_TEMP_DIR) on darwin.
#      path = "%r/test.txt"; 
#    };
#  };


  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello
    git
    #sops
    tmux
    zsh
    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Configure all programs
  programs.btop = {
    enable = true;
    settings = {
      color_theme = "gruvbox_dark_v2";
      vim_keys = true;
    };
  };

  programs.zsh = {
    enable = true;
    shellAliases  = {
      nixconfig="sudo nano ~/nixos/hosts/default/configuration.nix";
      nixhome="sudo nano ~/nixos/hosts/default/home.nix";
      nixswitch="sudo nixos-rebuild switch --flake ~/nixos/#default && exec zsh";
      nixflake="sudo nano ~/nixos/flake.nix";
      nixconfig-switch="nixconfig && nixswitch";
      nixhome-switch="nixhome && nixswitch";
      tmuxssh="tmux new-session -A -s ssh";
      testmsg="echo yeppy";
    };
  };

  programs.git = {
    enable = true;
    userName = "Tuna";
    userEmail = "tuna@sodamelon.com";
#    defaultBranch = "main";
  };

#  programs.ssh = {
#    enable = true;
#    matchBlocks = {
#      "my-remote-host" = {
#        hostName = "example.com";
#        user = "myusername";
#        identityFile = "/path/to/my/private/key"; # Optional: Specify the private key file for this host
#      };
#    };
#  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/tuna/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
