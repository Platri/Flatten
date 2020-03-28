#!/bin/bash
set -e
set -x
if [ "$RUN_MIGRATIONS" ]; then
  echo "RUNNING MIGRATIONS";
  yarn typeorm:migration:run:prod
fi
echo "START SERVER";
yarn start:prod