( if [ -z "$(getent passwd mediatomb)" ]; then
	/usr/sbin/useradd mediatomb -m -U -G audio,video,cdrom -c "MediaTomb"
fi )
<<<<<<< HEAD
( if [ ! -d /var/run/mediatomb ]; then
=======
( if [ -d /var/run/mediatomb ]; then
>>>>>>> a1094b498ea5deb9cee847d847b145b00fc9b49f
	mkdir -v -p /var/run/mediatomb
fi 
chown -c -R mediatomb:mediatomb /var/run/mediatomb )
