for NEW_CONFIG_FILE in $(find /etc/shorewall /etc/logrotate.d/shorewall.new -type f -print); do
  CONFIG_FILE=$(basename ${NEW_CONFIG_FILE} .new)
  if ! [ -f ${CONFIG_FILE} ]; then
    mv ${NEW_CONFIG_FILE} ${CONFIG_FILE}
  fi
done
