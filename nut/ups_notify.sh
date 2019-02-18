#!/bin/bash

TO='admin@example.com'
SMTP='smtp.example.com'

for UPS in `upsc -l`; do
	echo "${UPS}: `upsc ${UPS} ups.status`"
done | mailx -v\
       	-r ${TO}\
       	-s "$*"\
       	-S smtp=${SMTP}\
       	${TO}
