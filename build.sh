#!/bin/bash
date=$(date '+%Y%m%d')
arch=$(uname -m)

if [ $arch == "armv7l" ]; then
  sed  's/__base_image__/armhf\/alpine/g' Dockerfile > Dockerfile.armhf
  sudo docker image build -t j0nnylester/speedtest-cli:$date-armhf -f Dockerfile.armhf .
  sudo docker image push j0nnylester/speedtest-cli:$date-armhf
  rm Dockerfile.armhf
fi
