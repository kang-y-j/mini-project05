#!/bin/bash

PID=$(pgrep -f 'java -jar')

if [ -n "$PID" ]; then
  echo "Stopping application (PID=$PID)"
  kill $PID
  sleep 5
else
  echo "No running application found"
fi