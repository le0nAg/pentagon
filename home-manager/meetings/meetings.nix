{ pkgs, ... } : 
{
  home.packages = (with pkgs; [
    # meeting shits
    zoom-us
    teams-for-linux
    element-desktop

    #discord
	  vesktop
  ]);
}