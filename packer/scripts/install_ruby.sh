#!/bin/bash
apt-get update
while PID=$(pidof -s apt-get); do tail --pid=$PID -f /dev/null; done
apt-get install -y ruby-full ruby-bundler build-essential
