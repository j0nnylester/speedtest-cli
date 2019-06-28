#!/bin/bash
arch=$(uname -m)

if [ $arch == "armv7l" ]; then
  build_arch="armhf"
  sed  's/__base_image__/armhf\/alpine/g' Dockerfile > Dockerfile.$build_arch
fi

if [ $arch == "x86_64" ]; then
  build_arch="amd64"
  sed  's/__base_image__/alpine/g' Dockerfile > Dockerfile.$build_arch
fi

date=$(date '+%Y%m%d')
sudo docker image build -t j0nnylester/speedtest-cli:$date-$build_arch -t j0nnylester/speedtest-cli:latest-$build_arch -f Dockerfile.$build_arch .
sudo docker image push j0nnylester/speedtest-cli:$date-$build_arch
rm Dockerfile.$build_arch