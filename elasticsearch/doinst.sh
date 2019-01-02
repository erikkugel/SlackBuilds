#!/bin/bash
#
# SlackBuild for Elasticsearch
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
if [ -z "$(getent passwd elasticsearch)" ]; then
	/usr/sbin/useradd -r -U -c Elasticsearch elasticsearch
fi

# Set log folder permissions
chown elasticsearch:elasticsearch /usr/share/elasticsearch/plugins\
 /var/lib/elasticsearch\
 /var/log/elasticsearch\
 /var/run/elasticsearch\
 /tmp/elasticsearch

# Install configs and symlinks
for CONFIG in /etc/elasticsearch/*; do
        config ${CONFIG}
done
