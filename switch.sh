#!/usr/bin/env bash
set -e

#sudo git -C /etc/nixos/ pull -f --rebase
sudo nixos-rebuild switch --flake ./#default
