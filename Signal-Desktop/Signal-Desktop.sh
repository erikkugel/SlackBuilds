#!/bin/bash

cd /opt/Signal-Desktop && NODE_ENV=production yarn run start 2>&1>/dev/null &
