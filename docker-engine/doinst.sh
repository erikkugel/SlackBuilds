( if [ -z "$(getent group docker)" ]; then
	/usr/sbin/groupadd -r docker
fi )
