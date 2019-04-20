#!/bin/sh
cd $(dirname $0)

cd ../complete

mvn clean package
java -jar target/gs-spring-boot-0.1.0.jar

sudo rm -rf target

#./gradlew build
#ret=$?
#if [ $ret -ne 0 ]; then
#exit $ret
#fi
#rm -rf build

#cd ../initial

#mvn clean compile
#ret=$?
#if [ $ret -ne 0 ]; then
#exit $ret
#fi
#rm -rf target

#./gradlew compileJava
#ret=$?
#if [ $ret -ne 0 ]; then
#exit $ret
#fi
#rm -rf build

exit
