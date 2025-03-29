{ pkgs, ... } : 
{
  home.packages = with pkgs.jetbrains; [
    idea-community
    idea-ultimate
    clion
  ];
}