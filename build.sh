#!/bin/bash
ARCH=$(uname -m)
if [ "$ARCH" = "armv7l" ]; then
  sed 's|FROM imzcc/openresty:1.21.4.1-7-alpine|FROM imzcc/openresty:1.21.4.1-7-alpine|' Dockerfile > Dockerfile.tmp
else
  sed 's|FROM imzcc/openresty:1.21.4.1-7-alpine|FROM fabiocicerchia/nginx-lua:1.27.5-alpine3.21.3|' Dockerfile > Dockerfile.tmp
fi
docker build -f Dockerfile.tmp -t libretv:latest .
rm Dockerfile.tmp
