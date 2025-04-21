{ config, pkgs, ... }:

{
  home.file.".docker/config.json".text = ''
    {
      "experimental": "enabled",
      "psFormat": "table {{.ID}}\\t{{.Image}}\\t{{.Status}}\\t{{.Names}}"
    }
  '';
}