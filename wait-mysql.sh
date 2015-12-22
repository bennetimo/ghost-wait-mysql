#!/bin/bash

# This code is modified from https://github.com/docker/docker/issues/7445#issuecomment-101523662

echo "waiting for mysql to be available..."

MYSQL_LOOPS="10"

#wait for mysql
i=0
while ! nc $MYSQL_ENV_DB_HOST $MYSQL_PORT >/dev/null 2>&1 < /dev/null; do
  i=`expr $i + 1`
  if [ $i -ge $MYSQL_LOOPS ]; then
    echo "$(date) - ${MYSQL_ENV_DB_HOST}:${MYSQL_PORT} still not reachable, giving up"
    exit 1
  fi
  echo "$(date) - waiting for ${MYSQL_ENV_DB_HOST}:${MYSQL_PORT}..."
  sleep 1
done

echo "mysql is now available...continuing..."

exec /entrypoint.sh "$@"
