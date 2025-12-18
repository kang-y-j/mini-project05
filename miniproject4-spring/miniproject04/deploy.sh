#!/bin/bash
set -e

APP_DIR="/home/ubuntu/app"

# 기존 앱 종료(단순 버전)
pkill -f 'java -jar' || true

# 새 앱 실행: -plain.jar 제외
JAR=$(ls -1 "$APP_DIR"/*.jar | grep -v -- '-plain\.jar$' | head -n 1)

echo "Starting: $JAR"
nohup java -jar "$JAR" > "$APP_DIR/app.log" 2>&1 &