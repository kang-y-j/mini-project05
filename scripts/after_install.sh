#!/bin/bash
set -e

APP_DIR=/home/ubuntu/app

echo "Fixing ownership after file copy..."

chown -R ubuntu:ubuntu $APP_DIR
chmod -R 755 $APP_DIR
