{ config, pkgs, ...} : 
{
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      dracula-theme.theme-dracula
      yzhang.markdown-all-in-one
      bbenoist.nix

      ms-vscode.cpptools

      github.copilot

      dart-code.dart-code
      dart-code.flutter

      visualstudioexptteam.vscodeintellicode

    ];
  };
}
