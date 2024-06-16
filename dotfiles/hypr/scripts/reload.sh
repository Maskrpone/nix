#!/usr/bin/env bash

if ps aux | grep ".ags-wrapped" >/dev/null; then
	killall -q .ags-wrapped
	echo "ags detected"
fi
ags &
