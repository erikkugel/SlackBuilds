( if [ "$(getconf LONG_BIT)" == "64" ]; then
        LIBDIRSUFFIX="64"
else
        LIBDIRSUFFIX=""
fi
/sbin/ldconfig -v -n /usr/local/lib${LIBDIRSUFFIX} )
( if [ -z "$(getent passwd vlc)" ]; then
	/usr/sbin/useradd vlc -m
fi )
