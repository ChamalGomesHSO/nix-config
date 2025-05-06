{ lib, ... }:

{
  options.my.home.trustedGitDirs = lib.mkOption {
    type = with lib.types; listOf str;
    default = [];
    description = "List of directories Git should treat as safe.";
  };
}
