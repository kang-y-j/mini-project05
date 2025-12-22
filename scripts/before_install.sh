#!/bin/bash
set -e

APP_DIR=/home/ubuntu/app

echo "Preparing application directory..."

rm -rf $APP_DIR
mkdir -p $APP_DIR
chown -R ubuntu:ubuntu $APP_DIR
