#!/bin/bash



set -e
cd /Users/cz_michael/Google\ Drive/Work/workspace/SymfonyTechWebsite
mvn clean 
mvn install

wait
echo "mvn clean install ......... Done!"

# shutdown tomcat
echo "" > /usr/local/apache-tomcat-7.0.59/logs/catalina.out
cd /usr/local/apache-tomcat-7.0.59/bin
./shutdown.sh

wait
echo "tomcat shutdown ......... Done!"


# remove older war
rm -rf /usr/local/apache-tomcat-7.0.59/webapps/ROOT/*
rm -rf /usr/local/apache-tomcat-7.0.59/webapps/symfony-technologies-website-1.0-SNAPSHOT

wait
echo "removing old tomcat webapp files ......... Done!"


rsync --progress /Users/cz_michael/Google\ Drive/Work/workspace/SymfonyTechWebsite/target/symfony-technologies-website-1.0-SNAPSHOT.war /usr/local/apache-tomcat-7.0.59/webapps/symfony-technologies-website-1.0-SNAPSHOT.war

wait
echo "rsync ......... Done!"


# extract war file into ROOT directory
cd /usr/local/apache-tomcat-7.0.59/webapps/ROOT
jar -xvf ../symfony-technologies-website-1.0-SNAPSHOT.war


wait
echo "explode war file ......... Done!"


# startup tomcat
cd /usr/local/apache-tomcat-7.0.59/bin
./startup.sh

wait
echo "tomcat startup ......... Done!"


more /usr/local/apache-tomcat-7.0.59/logs/catalina.out


tail /usr/local/apache-tomcat-7.0.59/logs/catalina.out