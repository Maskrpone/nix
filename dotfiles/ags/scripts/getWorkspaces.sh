#!/usr/bin/env bash

NUMBER_OF_WORKSPACES=10

defaultWorkspace="󱓼"

workspaces=()

activeWorkspace=$(hyprctl activeworkspace | head -n 1 | awk '{print $3}')

for ((i = 1; i < $NUMBER_OF_WORKSPACES + 1; i++)); do
	workspaces+=($defaultWorkspace)
done

for ((i = 0; i < $NUMBER_OF_WORKSPACES + 1; i++)); do
	if [[ activeWorkspace -eq $(($i + 1)) ]]; then
		workspaces[$i]="󱨇"
	fi
done

echo ${workspaces[@]}
