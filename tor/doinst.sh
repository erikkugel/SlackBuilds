( if [ "$(getconf LONG_BIT)" == "64" ]; then
        LIBDIRSUFFIX="64"
else
        LIBDIRSUFFIX=""
fi
/sbin/ldconfig -v -n /usr/local/lib${LIBDIRSUFFIX} )
( if [ -z "$(getent passwd tor)" ]; then
	/usr/sbin/useradd tor -m -U -G audio,video,cdrom -c "TOR"
fi )
( if [ ! -d /var/run/tor ]; then
	mkdir -v -p /var/run/tor
fi 
chown -c -R tor:tor /var/run/tor )
