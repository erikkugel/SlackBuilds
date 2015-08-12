for NEW_CONFIG_FILE in $(find /etc/shorewall -type f); do
  CONFIG_FILE=$(basename ${NEW_CONFIG_FILE} .new)
  if ! [ -f ${CONFIG_FILE} ]; then
    mv ${NEW_CONFIG_FILE} ${CONFIG_FILE}
  fi
done

if [ -f /etc/logrotate.d/shorewall.new ] && [ ! -f /etc/logrotate.d/shorewall ]; then
  mv -v -f /etc/logrotate.d/shorewall.new /etc/logrotate.d/shorewall
fi
