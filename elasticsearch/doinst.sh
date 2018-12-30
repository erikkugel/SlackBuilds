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
if [ -z "$(getent passwd elasticsearch)" ]; then
	/usr/sbin/useradd -r -m -U -c Elasticsearch elasticsearch
fi

# Set log folder permissions
chown elasticsearch:elasticsearch /etc/elasticsearch\
 /var/lib/elasticsearch\
 /usr/share/elasticsearch/plugins\
 /var/log/elasticsearch\
 /var/run/elasticsearch\
 /usr/share/elasticsearch/bin\
 /usr/share/elasticsearch/lib\
 /usr/share/elasticsearch/modules

# Install new config files
for config in /etc/elasticsearch/*.new; do
        config $config
done

# Symlink binaries
for binary in /usr/share/elasticsearch/bin; do
        ln -v -s $binary /usr/bin/
done