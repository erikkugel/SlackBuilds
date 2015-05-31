( if [ "$(getconf LONG_BIT)" == "64" ]; then
        LIBDIRSUFFIX="64"
else
        LIBDIRSUFFIX=""
fi
/sbin/ldconfig -v -n /usr/local/lib${LIBDIRSUFFIX} )
( if [ -z "$(getent group nut)" ]; then
	/usr/sbin/groupadd vlc
fi
if [ -z "$(getent passwd ups)" ]; then
	/usr/sbin/useradd ups -g nut -c "UPS"
fi )
