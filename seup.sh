#!/bin/bash

set -e  # Exit on error

# Check if Nix is installed
if ! command nix --version &> /dev/null; then
    echo "Installing Nix..."
    sh <(curl -L https://nixos.org/nix/install) --daemon
    
    # Source Nix
    . ~/.nix-profile/etc/profile.d/nix.sh
else
    echo "Nix already installed."
fi

# Check if Home Manager channel is added
if ! nix-channel --list | grep -q home-manager; then
    echo "Adding Home Manager channel..."
    nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
    nix-channel --update
else
    echo "Nix home manager already installed."
fi

# Check if Home Manager is installed
if ! command -v home-manager &> /dev/null; then
    echo "Installing Home Manager..."
    export NIX_PATH=$HOME/.nix-defexpr/channels:/nix/var/nix/profiles/per-user/root/channels${NIX_PATH:+:$NIX_PATH}
    nix-shell '<home-manager>' -A install
fi

# Ensure config directory exists
mkdir -p ~/.config/home-manager

# Link configuration
echo "Linking configuration..."
ln -sf "$(pwd)/home.nix" ~/.config/home-manager/home.nix

# Apply configuration
echo "Applying configuration..."
home-manager switch -b backup

echo "Setup complete! Your Nix configuration has been applied."
