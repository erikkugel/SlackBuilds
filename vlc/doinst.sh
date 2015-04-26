( if [ "$(getconf LONG_BIT)" == "64" ]; then
        LIBDIRSUFFIX="64"
else
        LIBDIRSUFFIX=""
fi
/sbin/ldconfig -v -n /usr/local/lib${LIBDIRSUFFIX} )
( if [ -z "$(getent passwd vlc)" ]; then
	/usr/sbin/useradd vlc -m -U -G audio,video
fi )
( if [ -d /var/run/vlc ]; then
	mkdir -v -p /var/run/vlc
fi 
chown -c -R vlc:vlc /var/run/vlc )
