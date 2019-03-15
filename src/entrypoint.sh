#!/bin/bash

PROJECT_DIR=$(readlink -f .)
CONFIG=$PROJECT_DIR/conf/data-config.xml

echo "generating config $CONFIG"

cat $CONFIG | gomplate -o $CONFIG

cat $CONFIG

cd /opt/solr/example
java -Dsolr.solr.home='/opt/solr/watchclub/' -jar start.jar