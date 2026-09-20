#!/bin/bash
if [ -z "$(getent group docker)" ]; then
	/usr/sbin/groupadd -r docker
fi

if [ -z "$(getent passwd docker)" ]; then
	/usr/sbin/useradd -g docker -r docker
fi

/usr/bin/docker completion bash > /usr/share/bash-completion/completions/docker

