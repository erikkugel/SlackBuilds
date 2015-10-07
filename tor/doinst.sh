# Create a user
( if [ -z "$(getent passwd tor)" ]; then
	/usr/sbin/useradd -r -m -U -c "Tor" tor
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
