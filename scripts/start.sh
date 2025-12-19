#!/usr/bin/env bash
set -e

APP_NAME="miniproject4-next"
APP_DIR="/home/ubuntu/apps/miniproject4-next"
PORT=3000
LOG="$APP_DIR/start.log"

echo "===== START $(date) =====" >> "$LOG"

cd "$APP_DIR"
echo "PWD: $(pwd)" >> "$LOG"
echo "Node: $(node -v)" >> "$LOG"
echo "NPM: $(npm -v)" >> "$LOG"

# pm2 없으면 설치 (글로벌은 사전 설치 권장)
if ! command -v pm2 >/dev/null 2>&1; then
  echo "Installing pm2..." >> "$LOG"
  npm install -g pm2 >> "$LOG" 2>&1
fi

# node_modules 없거나 깨졌으면 재설치
if [ ! -d node_modules ] || [ ! -x node_modules/.bin/next ]; then
  echo "Installing dependencies (npm ci)..." >> "$LOG"
  rm -rf node_modules
  npm ci --omit=dev >> "$LOG" 2>&1
fi

# 기존 프로세스 있으면 정리
pm2 delete "$APP_NAME" >/dev/null 2>&1 || true

# Next.js 실행
echo "Starting Next.js..." >> "$LOG"
pm2 start "npx next start -p $PORT" --name "$APP_NAME" >> "$LOG" 2>&1
pm2 save >> "$LOG" 2>&1

echo "===== END $(date) =====" >> "$LOG"
