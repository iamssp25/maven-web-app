#!/bin/bash

echo " Building the Maven Web App...!! "
mvn clean package

echo "Deplohing the project into Apache tomcat"
cp target/sspcloudproweb.war /usr/local/tomcat8/webapps/
