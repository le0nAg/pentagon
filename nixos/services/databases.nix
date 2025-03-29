{ pkgs, lib, config, ...} : {
    services.mysql = {
        enable = true;
        package = pkgs.mariadb;
        user = "mysql";  # L'utente di default
        dataDir = "/var/lib/mysql";  # Dove risiede il database

    };
}