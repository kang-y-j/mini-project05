#!/bin/bash
set -e

APP_DIR="/home/ubuntu/app"

echo "[deploy] whoami=$(whoami) pwd=$(pwd)"
echo "[deploy] jars in $APP_DIR:"
ls -al "$APP_DIR" || true

pkill -f 'java -jar' || true

JAR=$(ls -1 "$APP_DIR"/*.jar | grep -v -- '-plain\.jar$' | head -n 1 || true)
echo "[deploy] selected JAR=$JAR"

if [ -z "$JAR" ]; then
  echo "[deploy] ERROR: no runnable jar found" >&2
  exit 1
fi

nohup java -jar "$JAR" > "$APP_DIR/app.log" 2>&1 &
echo "[deploy] started pid=$!"