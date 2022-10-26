#!/bin/bash

## This is a script to automatically install Sonarqube in centos server
## Date: 10/26/2022
## Author: Calistus Oguguo

echo " Sonarqube..... "

sleep 3

user-name= `whoami`

if [ $user-name != vagrant ];

then

	echo "You must run this program as user vagrant !!!"

	sleep 4

	exit 127

else

	echo "Great! Please be patient while Sonargube is getting ready to install on your centos server"

	sleep 4

fi

echo "Updating the server. Please be patient"

sleep 4

sudo yum update -y

sleep 2

sudo yum install java-11-openjdk-devel -y

sleep 2

cd /opt

sudo yum install wget -y

sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.3.0.51899.zip

sudo yum install unzip -y

sudo unzip /opt/sonarqube-9.3.0.51899.zip

sudo chown -R vagrant:vagrant /opt/sonarqube-9.3.0.51899

cd /opt/sonarqube-9.3.0.51899/bin/linux-x86-64

sudo firewall-cmd --permanent --add-port=9000/tcp

sudo firewall-cmd --reload

./sonar.sh start

echo "Sonargube have successfully installed. Please get your IP Address and this port ( :9000 ) to access your Sonarqube on browser"

