cd /etc/hostapd

for NEW_CONFIG_FILE in $(find . -type f -name 'hostapd\.[a-z]*\.new' -maxdepth 1); do
  CONFIG_FILE=$(basename ${NEW_CONFIG_FILE} .new)
  if ! [ -f ${CONFIG_FILE} ]; then
    mv ${NEW_CONFIG_FILE} ${CONFIG_FILE}
  fi
done

if [ -f wired.conf.new ] && [ ! -f wired.conf ]; then
  mv -v -f wired.conf.new wired.conf
fi

mkdir -p -v /var/run/hostapd
