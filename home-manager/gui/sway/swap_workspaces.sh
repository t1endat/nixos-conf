#!/bin/sh
# Assume the 2 recent workspaces belong to 2 outputs
output_1_name=$(swaymsg -t get_outputs --raw | jq '.[0].name' -r)
output_2_name=$(swaymsg -t get_outputs --raw | jq '.[1].name' -r)
workspace_on_1=$(swaymsg -t get_outputs --raw | jq '.[0].current_workspace' -r)
workspace_on_2=$(swaymsg -t get_outputs --raw | jq '.[1].current_workspace' -r)

# move workspace
swaymsg workspace number ${workspace_on_1:0:1}
swaymsg move workspace to output $output_2_name
swaymsg workspace number ${workspace_on_2:0:1}
swaymsg move workspace to output $output_1_name 

# move to main screen (workspace 2)
main_workspace=$(swaymsg -t get_outputs --raw | jq '.[1].current_workspace' -r)
swaymsg workspace number ${main_workspace:0:1}

