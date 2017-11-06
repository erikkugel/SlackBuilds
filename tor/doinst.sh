# Create a user
( if [ -z "$(getent passwd tor)" ]; then
	/usr/sbin/useradd -r -m -U -c "Tor" tor
fi )
# Create any required directories
( if [ ! -d /var/log/tor ]; then
	mkdir -v /var/log/tor
fi
chown -c tor:tor /var/log/tor )
( if [ ! -d /var/lib/tor/keys ]; then
	mkdir -v /var/lib/tor/keys
fi
chown -c tor:tor /var/lib/tor/keys )
