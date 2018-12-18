#!/bin/bash

for NEW_CONFIG_FILE in $(find /etc/suricata/*.new -type f -print); do
        CONFIG_FILE=$(dirname ${NEW_CONFIG_FILE})/$(basename ${NEW_CONFIG_FILE} .new)
                if ! [ -f ${CONFIG_FILE} ]; then
                mv -v ${NEW_CONFIG_FILE} ${CONFIG_FILE}
        fi
done