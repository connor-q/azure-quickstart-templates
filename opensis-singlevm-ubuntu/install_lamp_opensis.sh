#!/bin/bash
apt-get -y update

# set up a silent install of MySQL
dbpass=$1

export DEBIAN_FRONTEND=noninteractive
echo mysql-server-5.6 mysql-server/root_password password $dbpass | debconf-set-selections
echo mysql-server-5.6 mysql-server/root_password_again password $dbpass | debconf-set-selections

# install the LAMP stack
apt-get -y install apache2 mysql-server php5 php5-mysql  

# install OpenSIS
cd /var/www/html
sudo wget http://sourceforge.net/projects/opensis-ce/files/opensis6.0.zip/download -O opensis.zip
sudo apt-get install unzip
sudo unzip opensis.zip

# make the opensis-ce directory writable
sudo chmod -R +777 opensis-ce

# restart Apache
apachectl restart
