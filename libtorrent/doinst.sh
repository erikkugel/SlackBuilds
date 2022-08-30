( if [ "$(getconf LONG_BIT)" == '64' ]; then
        LIBDIRSUFFIX='64'
else
        LIBDIRSUFFIX=''
fi
/sbin/ldconfig -n /usr/lib${LIBDIRSUFFIX} )
