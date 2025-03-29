{ config, pkgs, ... }:
{
    users.users.leonardo = {
        isNormalUser = true;
        description = "leonardo";
        extraGroups = [ "networkmanager" "wheel" "adbusers"];
    };
}