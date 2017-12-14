dnl Check for LIBUSB compiler flags. On success, set nut_have_libusb="yes"
dnl and set LIBUSB_CFLAGS and LIBUSB_LDFLAGS. On failure, set
dnl nut_have_libusb="no". This macro can be run multiple times, but will
dnl do the checking only once. 

AC_DEFUN([NUT_CHECK_ASCIIDOC], 
[
if test -z "${nut_have_asciidoc_seen}"; then
	nut_have_asciidoc_seen=yes

	AC_PATH_PROGS([ASCIIDOC], [asciidoc])
	if test -n "${ASCIIDOC}"; then
		AC_MSG_CHECKING([for asciiDoc version])
		ASCIIDOC_VERSION="`${ASCIIDOC} --version 2>/dev/null`"
		dnl strip 'asciidoc ' from version string
		ASCIIDOC_VERSION="${ASCIIDOC_VERSION##* }"
		AC_MSG_RESULT(${ASCIIDOC_VERSION} found)
	fi

	AC_PATH_PROGS([A2X], [a2x])
	if test -n "${A2X}"; then
		AC_MSG_CHECKING([for a2x version])
		A2X_VERSION="`${A2X} --version 2>/dev/null`"
		dnl strip 'a2x ' from version string
		A2X_VERSION="${A2X_VERSION##* }"
		AC_MSG_RESULT(${A2X_VERSION} found)
	fi

	AC_PATH_PROGS([DBLATEX], [dblatex])
	if test -n "${DBLATEX}"; then
		AC_MSG_CHECKING([for dblatex version])
		DBLATEX_VERSION="`${DBLATEX} --version 2>/dev/null`"
		dnl strip 'dblatex version ' from version string
		DBLATEX_VERSION="${DBLATEX_VERSION##* }"
		AC_MSG_RESULT(${DBLATEX_VERSION} found)
	fi

	AC_PATH_PROGS([XSLTPROC], [xsltproc])
	if test -n "${XSLTPROC}"; then
		AC_MSG_CHECKING([for xsltproc version])
		XSLTPROC_VERSION="`${XSLTPROC} --version 2>/dev/null`"
		dnl strip 'xsltproc version ' from version string
		XSLTPROC_VERSION="${XSLTPROC_VERSION##* }"
		AC_MSG_RESULT(${XSLTPROC_VERSION} found)
	fi

	AC_PATH_PROGS([XMLLINT], [xmllint])
	if test -n "${XMLLINT}"; then
		AC_MSG_CHECKING([for xmllint version])
		XMLLINT_VERSION="`${XMLLINT} --version 2>/dev/null`"
		dnl strip 'xmllint version ' from version string
		XMLLINT_VERSION="${XMLLINT_VERSION##* }"
		AC_MSG_RESULT(${XMLLINT_VERSION} found)
	fi

	AC_PATH_PROGS([SOURCE_HIGHLIGHT], [source-highlight])

fi
])
