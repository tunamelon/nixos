{
  # Shell aliases
  environment.interactiveShellInit = ''
    alias nixconfig='sudo nano /etc/nixos/configuration.nix'
    alias nixswitch='sudo nixos-rebuild switch'
    alias nixconfig-switch='nixconfig && nixswitch && exec bash'
    alias tmuxssh='tmux new-session -A -s ssh'
    alias testing='echo yep'    
  '';
}
