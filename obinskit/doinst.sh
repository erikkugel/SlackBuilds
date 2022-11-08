#!/bin/sh
if [ -f /etc/udev/rules.d/99-obinslab.rules ]; then
	/sbin/udevadm control --reload-rules \
		&& /sbin/udevadm trigger \
		--attr-match=idVendor=04d9 \
		--attr-match=idProduct=a293
fi

if [ ! -e /usr/bin/obinskit ]; then
	ln -v -s /opt/obinskit/obinskit /usr/bin/obinskit
fi

