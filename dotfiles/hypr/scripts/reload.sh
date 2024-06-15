#!/usr/bin/env bash

if ps aux | grep ".eww-wrapped" >/dev/null; then
	killall -q .eww-wrapped
fi
eww daemon &
eww open bar &
