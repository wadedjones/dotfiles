#!/bin/bash

if [[ -e "/dev/input/event15" ]]; then
	/usr/bin/kmonad /home/wadedjones/.config/kmonad/configzoom.kbd
fi
