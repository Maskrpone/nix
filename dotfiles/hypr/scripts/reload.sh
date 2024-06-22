#!/usr/bin/env bash

if ps aux | grep ".ags-wrapped" >/dev/null; then
	killall -q .ags-wrapped
	echo "ags is already active, restarting..."
fi

ags &
