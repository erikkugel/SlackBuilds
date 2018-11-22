# Create a user
if [ -z "$(getent passwd transmission)" ]; then
	/usr/sbin/useradd -r -m -U -c "Transmission" transmission
fi
if ! [ -f /home/transmission/.config/transmission-cli/settings.json ]; then
	if ! [ -d /home/transmission/.config/transmission-cli ]; then
		mkdir -p /home/transmission/.config/transmission-cli
	fi
	transmission-daemon -d 2> /home/transmission/.config/transmission-cli/settings.json
fi