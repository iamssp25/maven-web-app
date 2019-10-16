#!/bin/bash

echo " Building the Maven Web App...!! "
/usr/local/src/apache-maven/bin/mvn clean package

echo "Deplohing the project into Apache tomcat"
cd $WORKSPACE
cp target/sspcloudproweb.war /usr/local/tomcat8/webapps/

