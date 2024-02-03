{
  programs.waybar = {
    enable = true;
    config = rec {
      # Customize your Waybar configuration here
      format = "%time% | %battery% | %workspaces%";
  
      # Modules as an example
      [module/time]
        type = "time";
        format = "%H:%M:%S";
  
      [module/battery]
        type = "battery";
        format = "%percentage%%";
  
      [module/workspaces]
        type = "workspaces";
        format = "%n%% (%i)";
    };
  };
}
