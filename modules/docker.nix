{ config, pkgs, ... }:

{
    home.file.".docker/config.json".text = ''
        {
        "experimental": "enabled",
        "psFormat": "table {{.ID}}\\t{{.Image}}\\t{{.Status}}\\t{{.Names}}"
        }
    '';

    home.file.".docker/daemon.json".text = ''
    {
        "features": {
        "buildkit": true
        },
        "experimental": true,
        "storage-driver": "overlay2"
    }
    '';
}