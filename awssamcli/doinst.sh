CURRENT_VERSION_PATH=$(ls -1trd /usr/share/aws-sam-cli/[0-9]* | tail -1)
ln -s -f ${CURRENT_VERSION_PATH} /usr/share/aws-sam-cli/current
ln -s -f /usr/share/aws-sam-cli/current/bin/sam /usr/bin/sam
