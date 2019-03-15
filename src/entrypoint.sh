#!/bin/bash

PROJECT_DIR=$(readlink -f .)
CONFIG=$PROJECT_DIR/spaces.conf

echo "generating config ..."

cat $CONFIG | gomplate -o $CONFIG

make