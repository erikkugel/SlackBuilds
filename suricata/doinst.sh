#!/bin/bash
#
# https://www.slackwiki.com/Doinst.sh

config() {
        NEW="$1"
        OLD="$(dirname $NEW)/$(basename $NEW .new)"
        # If there's no config file by that name, mv it over:
        if [ ! -r $OLD ]; then
                mv $NEW $OLD
        elif [ "$(cat $OLD | md5sum)" = "$(cat $NEW | md5sum)" ]; then # toss the redundant copy
                rm $NEW
        fi
        # Otherwise, we leave the .new copy for the admin to consider...
}

# Create a user
if [ -z "$(getent passwd suri)" ]; then
	/usr/sbin/useradd -r -m -U -c Suricata suri
fi

# Set log folder permissions
chown suri:suri /var/log/suricata

# Install new config files
for NEW_CONFIG_FILE in $(ls -1 /etc/suricata/*.new); do
        CONFIG_FILE=$(dirname ${NEW_CONFIG_FILE})/$(basename ${NEW_CONFIG_FILE} .new)
        if ! [ -f ${CONFIG_FILE} ]; then
                mv -v ${NEW_CONFIG_FILE} ${CONFIG_FILE}
        fi
done