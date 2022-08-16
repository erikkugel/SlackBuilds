#!/bin/bash
if [ -z "$(grep docker /etc/group)" ]; then
	/usr/sbin/groupadd -r docker
fi
