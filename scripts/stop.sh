#!/bin/bash
set -e

APP_DIR=/home/ubuntu/app
PID_FILE="$APP_DIR/app.pid"

if [ -f "$PID_FILE" ]; then
  PID=$(cat "$PID_FILE" || true)
  if [ -n "$PID" ] && kill -0 "$PID" 2>/dev/null; then
    kill "$PID"
    sleep 5
  fi
  rm -f "$PID_FILE"
else
  # PID 파일이 없으면 java 프로세스가 있는지 확인 후 종료(선택)
  PID=$(pgrep -f 'java -jar' || true)
  if [ -n "$PID" ]; then
    kill $PID
    sleep 5
  fi
fi

