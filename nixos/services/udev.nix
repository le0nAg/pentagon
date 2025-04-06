{ pkgs, lib, config, ...} : {
    services.udev.extraRules = builtins.readFile ./50-framework16.rules;
}