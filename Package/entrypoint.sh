#!/bin/bash

echo -------DEBUG-------
echo
echo "uname: $(uname -a)"
echo "TARGETS env var: ${TARGETS}"
echo "Arguments: $@"
echo "Is GitHub Action? ${GITHUB_ACTIONS}"
echo
echo -----END DEBUG-----

if [ "${GITHUB_ACTIONS}" == 'true' ]; then
	echo "Use GitHub Actions mounts..."
	SLACKBUILDS_DIRECTORY=/github/workspace
	PACKAGES_DIRECTORY=/github/workspace/packages
else
	echo "Use Docker volumes under /SlackBuild and /packages..."
	SLACKBUILDS_DIRECTORY=/SlackBuilds
	PACKAGES_DIRECTORY=/packages
fi

if [ -n ${1} ] && [ -z ${TARGETS} ]; then
	TARGETS=${1}
fi

IFS=','
for TARGET in ${TARGETS}; do
	echo "Building ${TARGET}..."
	cd ${SLACKBUILDS_DIRECTORY}/${TARGET}
	./${TARGET}.SlackBuild 2>&1 | tail -n 10
	installpkg /tmp/${TARGET}-*.txz
	cp /tmp/${TARGET}-*.txz ${PACKAGES_DIRECTORY}
	echo "${TARGET} Done."
done

