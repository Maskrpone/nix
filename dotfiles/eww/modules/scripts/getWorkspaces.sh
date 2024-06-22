#!/usr/bin/env bash

NUMBER_OF_WORKSPACES=10

getWs() {
	activeWorkspace=$(hyprctl activeworkspace | head -n 1 | awk '{print $3}')
	ws=$(hyprctl workspaces -j | jq -c --argjson active_id "$activeWorkspace" 'map({id: .id, is_occupied: (.windows > 0), is_active: (.id == $active_id)})')
	for ((i = 1; i < $NUMBER_OF_WORKSPACES + 1; i++)); do
		match=$(jq --argjson i "$i" 'map(select(.id == $i))' <<<$ws)
		# echo "match is : $match"
		if [[ "$match" == "[]" ]]; then
			ws=$(jq --argjson i "$i" '. += [{"id": $i, "is_occupied": 0, "is_active": 0}]' <<<$ws)
		fi
	done

	echo $(jq 'sort_by(.id)' <<<$ws)
}

# first execution of the function
getWs
# we make the script running based on events received by listening to the hyprland socket2 for updates of workspaces
# link : https://wiki.hyprland.org/IPC/#how-to-use-socket2-with-bash
# socat is a binary that allows us to listen specific sockets.
socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do
	getWs
done

getWs
