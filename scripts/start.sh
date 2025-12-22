#!/bin/bash
set -e

APP_DIR=/home/ubuntu/app
JAR_FILE=$(ls $APP_DIR | grep '\.jar$' | head -n 1)

echo "Starting app with JAR=$JAR_FILE"

cd $APP_DIR
nohup /usr/bin/java -jar $JAR_FILE > app.log 2>&1 &