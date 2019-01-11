#!/bin/bash
#
# SlackBuild for Filebeat
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

# Install configs and symlinks
for CONFIG in /etc/filebeat/*.new; do
        config ${CONFIG}
done
