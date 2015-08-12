<<<<<<< HEAD
for NEW_CONFIG_FILE in $(find /etc/shorewall /etc/logrotate.d/shorewall.new -type f -print); do
=======
for NEW_CONFIG_FILE in $(find /etc/shorewall /etc/logrotate.d/shorewall -type f -print); do
>>>>>>> f60357ae11068c72e2db9a0a49e909ac50a06269
  CONFIG_FILE=$(basename ${NEW_CONFIG_FILE} .new)
  if ! [ -f ${CONFIG_FILE} ]; then
    mv ${NEW_CONFIG_FILE} ${CONFIG_FILE}
  fi
done
