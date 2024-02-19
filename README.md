# nixos-config

Minimal setup

```
nix-shell -p git vim
cd ~
git clone https://github.com/krscott/nixos-config.git nixos
cd nixos
sudo cp *.nix /etc/nixos
sudo nixos-rebuild switch
```
