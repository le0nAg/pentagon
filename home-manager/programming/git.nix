{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "le0nAg";
    userEmail = "leonardoagostini123@email.com";
    extraConfig = {
      init.defaultBranch = "main";
      commit.gpgsign = true;
      gpg.format = "ssh";
      user.signingkey = "~/.ssh/id_ed25519.pub";

      pull.rebase = "false";
    };
  };
}
