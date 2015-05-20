#!/usr/bin/env bash

echo "Installing JDK 8..."

sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get update
# Auto Accept license
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
# Install JDK8 and set environment variables
sudo apt-get -y install oracle-java8-installer oracle-java8-set-default

echo "DONE installing JDK 8"
