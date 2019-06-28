#!/bin/bash
date=$(date '+%Y%m%d')
arch=$(uname -m)
sudo docker image build -t j0nnylester/speedtest-cli:$date-$arch -f Dockerfile.$arch .
sudo docker image push j0nnylester/speedtest-cli:$date-$arch
