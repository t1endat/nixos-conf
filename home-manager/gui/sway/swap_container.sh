#!/bin/sh
# This code used for swap 2 containers in 2 workspaces (in 2 different outputs),for better workflow  

# Get name of 2 workspaces
workspace_on_1=$(swaymsg -t get_outputs --raw | jq '.[0].current_workspace' -r)
workspace_on_2=$(swaymsg -t get_outputs --raw | jq '.[1].current_workspace' -r)
other_workspace=10 

# move workspace
# move 1 -> 10, 2 -> 1 and 10 -> 2
swaymsg workspace number ${workspace_on_1:0:1}
swaymsg move container to workspace number $other_workspace
swaymsg workspace number ${workspace_on_2:0:1}
swaymsg move container to workspace number ${workspace_on_1:0:1}

swaymsg workspace number $other_workspace
swaymsg move container to workspace number ${workspace_on_2:0:1}

# to hide other_workspace
swaymsg workspace number ${workspace_on_1:0:1}

# move to main workspace (workspace 2)
main_workspace=$(swaymsg -t get_outputs --raw | jq '.[1].current_workspace' -r)
swaymsg workspace number ${main_workspace:0:1}


