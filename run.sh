#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

if [ -f ./settings.conf ]
then
    source ./settings.conf
else
    echo Could not find settings.conf, exiting...
    exit 1
fi
docker build . -t picash

docker run -d --rm --env-file ${SCRIPT_DIR}/settings.conf --name picash picash

sleep 30

docker exec -ti picash earnapp register | grep -Eo 'https.+'