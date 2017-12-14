#!/bin/sh
################################################################################
# A script to ease the generation of NUT device dumps for NUT Devices Dumps Library
################################################################################
# Author: (C) Arnaud Quette <ArnaudQuette@Eaton.com>
# License: GPL v2+
################################################################################
# FIXME:
#  - check if a previous report exists, and increase report number
#  - we currently use the .dev format ; but also consider the NDS format
#     http://www.networkupstools.org/ddl/
################################################################################

strUsage="Usage: $0 <device_name>"

# Check command line parameter (<device_name>)
if [ -z "$1" ]; then
	echo "$strUsage"
	exit
else
	DDL_DEVICE_NAME=$1
fi

# Test communication with the device
testResult="`upsc ${DDL_DEVICE_NAME} 2> /dev/null`"
if [ $? -gt 0 ]; then
	echo "Can't communicate with ${DDL_DEVICE_NAME}"
	exit
fi

# Build the filename
# <manufacturer>__<model>__<driver-name>__<nut-version>__<report-number>.<extension>
# Process the Manufacturer name 
RAW_DDL_MFR="`upsc ${DDL_DEVICE_NAME} device.mfr 2>/dev/null`"
if [ "${RAW_DDL_MFR}" = "EATON" ]; then
	RAW_DDL_MFR="Eaton"
fi
# Replace spaces with underscores
DDL_MFR="`echo ${RAW_DDL_MFR} | sed s/\ /_/g`"
# Process the Model name 
# Replace spaces with underscores
RAW_DDL_MODEL="`upsc ${DDL_DEVICE_NAME} device.model 2>/dev/null`"
DDL_MODEL="`echo ${RAW_DDL_MODEL} | sed s/\ /_/g`"
# Process the driver name and NUT version
DDL_DRIVER_NAME="`upsc ${DDL_DEVICE_NAME} driver.name 2>/dev/null`"
DDL_NUT_VERSION="`upsc ${DDL_DEVICE_NAME} driver.version 2>/dev/null`"
# TODO: check if a similar file exists, to update Report nb
DDL_REPORT_NUMBER="01"
DDL_FILENAME="${DDL_MFR}__${DDL_MODEL}__${DDL_DRIVER_NAME}__${DDL_NUT_VERSION}__${DDL_REPORT_NUMBER}.dev"

# Dump device data into the file
echo "${testResult}" > ${DDL_FILENAME}
echo "${DDL_FILENAME} generated using ${DDL_DEVICE_NAME} "
