( if [ -z "$(getent passwd mediatomb)" ]; then
	/usr/sbin/useradd mediatomb -m -U -G audio,video,cdrom -c "MediaTomb"
fi )
( if [ -d /var/run/mediatomb ]; then
	mkdir -v -p /var/run/mediatomb
fi 
chown -c -R mediatomb:mediatomb /var/run/mediatomb )
