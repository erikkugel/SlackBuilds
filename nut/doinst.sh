( if [ "$(getconf LONG_BIT)" == "64" ]; then
        LIBDIRSUFFIX="64"
else
        LIBDIRSUFFIX=""
fi
/sbin/ldconfig -v -n /usr/lib${LIBDIRSUFFIX} )
( if [ -z "$(getent group nut)" ]; then
	/usr/sbin/groupadd nut
fi
if [ -z "$(getent passwd ups)" ]; then
	/usr/sbin/useradd ups -g nut -c "UPS"
fi )
( if ! [ -d /var/state/ups ]; then
	mkdir -v -p /var/state/ups
	chown ups:nut /var/state/ups
	chmod og-rwx /var/state/ups
fi )
