#!/bin/bash

tree /

nohup /usr/local/bin/dockerd-entrypoint.sh > dockerd.log 2>&1 &

while [ true ]; do
    grep "Starting up" dockerd.log > /dev/null
    if [ $? -eq 0 ]; then
        break
    fi
    grep "Exit" dockerd.log > /dev/null
    if [ $? -eq 0 ]; then
        cat dockerd.log
        exit 1
    fi
done;

if [ ! -z "${ADDITIONAL_DEPS}" ]; then
    apk add --no-cache ${ADDITIONAL_DEPS}
fi

git clone ${GIT_REPO} work

cd work

go test ${TEST_ARGS} ./...
