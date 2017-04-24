#!/bin/bash

# exit on any error
set -e

echo "Welcome to setupPWD.sh"


# install needed bits in a loop because a lot of installs happen
# on VM init, so won't be able to grab the dpkg lock immediately
until apt-get -y update && apt-get -y install golang git docker.io
do
  echo "Trying again"
  sleep 2
done

cd /usr/share/go/src
mkdir github.com
cd github.com
mkdir franela
cd franela
git clone https://github.com/franela/play-with-docker.git

docker swarm init
sudo modprobe xt_ipvs
go get -v -d -t ./...
docker-compose up


echo "Done!"