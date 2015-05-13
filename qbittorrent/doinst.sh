<<<<<<< HEAD
( if [ "$(getconf LONG_BIT)" == "64" ]; then
        LIBDIRSUFFIX="64"
else
        LIBDIRSUFFIX=""
fi
/sbin/ldconfig -v -n /usr/local/lib${LIBDIRSUFFIX} )
( if [ -z "$(getent passwd qbittorrent)" ]; then
	/usr/sbin/useradd qbittorrent -m -U -c "qBitTorrent"
fi )
( if [ ! -d /var/run/qbittorrent ]; then
	mkdir -v -p /var/run/qbittorrent
fi 
chown -c -R qbittorrent:qbittorrent /var/run/qbittorrent )
=======
( if [ -x /usr/bin/update-desktop-database ]; then
  /usr/bin/update-desktop-database -q usr/share/applications >/dev/null 2>&1
fi )

( if [ -e usr/share/icons/hicolor/icon-theme.cache ]; then
  if [ -x /usr/bin/gtk-update-icon-cache ]; then
    /usr/bin/gtk-update-icon-cache usr/share/icons/hicolor >/dev/null 2>&1
  fi
fi )
>>>>>>> qbittorrent
