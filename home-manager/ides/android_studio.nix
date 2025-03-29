{ pkgs, ... } : 
{
  home.packages = (with pkgs; [
    android-studio
    android-studio-tools
  ]);

}
