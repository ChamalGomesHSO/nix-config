# Nix Home Manager Setup Guide

This document walks you through setting up Nix and Home Manager to manage your system configuration. This is catered towards Azure ML compute instances with it's inherent volume configuration challenges. Still WIP


### 1. Fork and Clone this Repo

Clone from your forked repo:

```bash
cd repos
git clone <repo>
```

### 2. Install Nix Package Manager

If Nix is not installed, run the official installer:

```bash
sh <(curl -L https://nixos.org/nix/install) --daemon
```

Verify installation:

```bash
nix --version
```

### 3. Build and Activate Your Configuration

This builds the Home Manager configuration for the current system:

```bash
nix build .#homeConfigurations.azureuser.activationPackage
```

Activate it:

```bash
./result/activate
```

### 4. Apply Your Changes 
To reapply changes after editing your config:

```bash
nix build .#homeConfigurations.azureuser.activationPackage
./result/activate
```

### 5. Roll Back if Needed

This lists previous generations. You can activate an earlier one using its path.

```bash
home-manager generations
```

### 6. Pruning Garbage 

Prune nix system garbage:

```bash
nix-collect-garbage --delete-older-than 10d
```

## Troubleshooting

- If you encounter permission issues during Nix installation, make sure you have sudo access
- If Home Manager fails to install, verify that your Nix channels are properly updated
- For configuration errors, check the syntax in your home.nix file

## Additional Resources

- [Nix Documentation](https://nixos.org/manual/nix/stable/)
- [Home Manager Documentation](https://nix-community.github.io/home-manager/)
- [Home Manager Options](https://nix-community.github.io/home-manager/options.html)
- [Nix Packages](https://search.nixos.org/packages)

## License

This project is licensed under the MIT License - see the LICENSE file for details.
