#!/usr/bin/env bash

apt-get update

sudo aptitude install -y git openjdk-7-jdk

# install leiningen
if [ ! -f ~vagrant/bin/lein ]; then

  su -l vagrant -c "mkdir -p ~vagrant/bin"

  su -l vagrant -c "wget https://raw.github.com/technomancy/leiningen/stable/bin/lein -O ~vagrant/bin/lein"

  su -l vagrant -c "chmod +x ~vagrant/bin/lein"

  su -l vagrant -c "echo 'export PATH=~vagrant/bin:$PATH' | tee -a ~vagrant/.bashrc"

  su -l vagrant -c "cp /vagrant/profiles.clj ~vagrant/.lein/"

  su -l vagrant -c "~/bin/lein version"
fi

# Install MongoDb
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list
sudo apt-get update
sudo apt-get install -y mongodb-org
