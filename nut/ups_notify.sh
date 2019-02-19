#!/bin/bash

if [ -z ${1} ] || [ -z ${2} ] || [ -z ${3} ]; then
        echo "Usage: `basename $0` < email > < smtp relay > < subject >"
        exit 1
fi

for UPS in `upsc -l`; do
        echo "${UPS}: `upsc ${UPS} ups.status`"
done | mailx -v\
        -r "`basename $0`@`hostname -f`"\
        -s "${3}"\
        -S smtp="${2}"\
        "${1}"
