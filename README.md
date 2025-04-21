# Nix Home Manager Setup Guide

This document walks you through setting up Nix and Home Manager to manage your system configuration.


### 1. Install Nix Package Manager

First, check if Nix is already installed on your system:

```bash
nix --version
```

If Nix is not installed, run the official installer:

```bash
sh <(curl -L https://nixos.org/nix/install) --daemon
```

After installation, source the Nix profile to use it in your current session:

```bash
. ~/.nix-profile/etc/profile.d/nix.sh
```

### 2. Add Home Manager Channel

Check if the Home Manager channel is already added:

```bash
nix-channel --list | grep home-manager
```

If it's not listed, add the Home Manager channel:

```bash
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
```

### 3. Install Home Manager

Check if Home Manager is installed:

```bash
home-manager --version
```

If it's not installed, set up the NIX_PATH environment variable and install Home Manager:

```bash
export NIX_PATH=$HOME/.nix-defexpr/channels:/nix/var/nix/profiles/per-user/root/channels${NIX_PATH:+:$NIX_PATH}
nix-shell '<home-manager>' -A install
```

### 4. Configure Home Manager

Create the configuration directory if it doesn't exist:

```bash
mkdir -p ~/.config/home-manager
```

Link your home.nix configuration file:

```bash
# If you're in the directory with your home.nix file:
ln -sf "$(pwd)/home.nix" ~/.config/home-manager/home.nix
ln -sf "$(pwd)/modules" ~/.config/home-manager/modules
```

### 5. Apply Your Configuration

Apply your configuration using Home Manager:

```bash
home-manager switch -b backup
```

The `-b backup` flag creates a backup of your previous configuration.

### 6. Rollback to previous generation

Select previous generation link and run respective activation script

```bash
home-manager generations 
```

## Troubleshooting

- If you encounter permission issues during Nix installation, make sure you have sudo access
- If Home Manager fails to install, verify that your Nix channels are properly updated
- For configuration errors, check the syntax in your home.nix file

## Additional Resources

- [Nix Documentation](https://nixos.org/manual/nix/stable/)
- [Home Manager Documentation](https://nix-community.github.io/home-manager/)
- [Home Manager Options](https://nix-community.github.io/home-manager/options.html)

## License

This project is licensed under the MIT License - see the LICENSE file for details.
