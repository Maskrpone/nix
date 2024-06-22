#!/usr/bin/env bash

EMPTY="󱓼"
BUSY="󱓻"
FOCUSED="󱨇"

dispatch() {
	hyprctl dispatch workspace $1
}

echo "test"
sleep 2
echo "test2"
