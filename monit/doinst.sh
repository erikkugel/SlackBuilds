#!/bin/sh
if [ ! -f /etc/monitrc ]; then
	mv -v /etc/monitrc.new /etc/monitrc
fi
