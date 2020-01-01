#!/usr/bin/env bash

sudo apt-get update
sudo apt-get install -y git, docker-ce
git clone https://github.com/vjyq/huz.git
cd huz
bash docker-compose.sh

