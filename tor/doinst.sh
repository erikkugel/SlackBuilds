# Link any dynamic libraries
( if [ "$(getconf LONG_BIT)" == "64" ]; then
        LIBDIRSUFFIX="64"
else
        LIBDIRSUFFIX=""
fi
/sbin/ldconfig -v -n /usr/local/lib${LIBDIRSUFFIX} )
# Create a user
( if [ -z "$(getent passwd tor)" ]; then
	/usr/sbin/useradd -r -U -c "TOR" -d / -s /bin/false tor
fi )
# Create any required directories
( if [ ! -d /usr/local/var/lib/tor/keys ]; then
	mkdir -v -p /usr/local/var/lib/tor/keys
fi 
chown -c -R tor:tor /usr/local/var/lib/tor )
( if [ ! -d /usr/local/var/log/tor ]; then
	mkdir -v -p /usr/local/var/log/tor
fi 
chown -c -R tor:tor /usr/local/var/log/tor )
