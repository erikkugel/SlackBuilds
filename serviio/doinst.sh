#!/bin/bash
#
# SlackBuild for serviio
#
# https://docs.slackware.com/slackware:slackbuild_scripts
# https://www.slackwiki.com/Doinst.sh
# https://google.github.io/styleguide/shell.xml

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
if [ -z "$(getent passwd serviio)" ]; then
	/usr/sbin/useradd -r -m -U -c Serviio serviio
fi

# Set log folder permissions
chown -R serviio:serviio /usr/share/serviio-2.0

# Install configs and symlinks
for CONFIG in /usr/share/serviio-2.0/bin/*.new; do
        config ${CONFIG}
done
