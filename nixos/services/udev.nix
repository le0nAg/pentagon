{ pkgs, lib, config, ...} : {
    services.udevextraRules = builtins.readFile ./50-framework16.rules;
}