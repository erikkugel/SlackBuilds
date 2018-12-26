( if [ "$(getconf LONG_BIT)" == "64" ]; then
        LIBDIRSUFFIX="64"
else
        LIBDIRSUFFIX=""
fi
/sbin/ldconfig -v -n /usr/local/lib${LIBDIRSUFFIX} )
( if [ -z "$(getent passwd qbittorrent)" ]; then
	/usr/sbin/useradd qbittorrent -m -U -c "qBitTorrent"
fi )
( if [ ! -d /var/run/qbittorrent ]; then
	mkdir -v -p /var/run/qbittorrent
fi 
chown -c -R qbittorrent:qbittorrent /var/run/qbittorrent )
