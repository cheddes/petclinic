#!/bin/bash
set -e

if [ "$ENV" = 'DEV' ]; then
echo "Running Development Server"
cd /app/spring-petclinic-master
mvn tomcat7:run
elif [ "$ENV" = 'UNIT' ]; then
echo "Running Unit Tests"
cd /app/spring-petclinic-master
mvn clean verify
else
echo "Running Production Server"
cd /app/spring-petclinic-master
mvn tomcat7:run
fi