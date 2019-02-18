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
# Suggested by `makepkg`
( cd usr/lib64 ; rm -rf libnutclient.so.0 )
( cd usr/lib64 ; ln -sf libnutclient.so.0.0.0 libnutclient.so.0 )
( cd usr/lib64 ; rm -rf libnutscan.so )
( cd usr/lib64 ; ln -sf libnutscan.so.1.0.0 libnutscan.so )
( cd usr/lib64 ; rm -rf libnutclient.so )
( cd usr/lib64 ; ln -sf libnutclient.so.0.0.0 libnutclient.so )
( cd usr/lib64 ; rm -rf libupsclient.so )
( cd usr/lib64 ; ln -sf libupsclient.so.4.0.0 libupsclient.so )
( cd usr/lib64 ; rm -rf libupsclient.so.4 )
( cd usr/lib64 ; ln -sf libupsclient.so.4.0.0 libupsclient.so.4 )
( cd usr/lib64 ; rm -rf libnutscan.so.1 )
( cd usr/lib64 ; ln -sf libnutscan.so.1.0.0 libnutscan.so.1 )
# Trigger udev after installing NUT UPS rules
/sbin/udevadm control --reload-rules && /sbin/udevadm trigger