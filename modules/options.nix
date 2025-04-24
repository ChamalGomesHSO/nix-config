{ lib, ... }:

{
  options.my.home.trustedGitDirs = lib.mkOption {
    type = with lib.types; listOf str;
    default = [];
    description = "List of directories Git should treat as safe.";
  };

  options.my.home.azureUserDir = lib.mkOption {
    type = lib.types.str;
    default = "/home/azureuser";
    description = "Azure user directory for custom scripts or paths.";
  };
}
