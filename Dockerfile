#pull base image
FROM openjdk:8-jdk-alpine

#maintainer
MAINTAINER ajitsangwan2006@gmail.com

#expose port 9090
EXPOSE 9090

#default command
CMD java -jar /data/gs-spring-boot-0.1.0.jar

#copy hello world to docker image
ADD ./data/gs-spring-boot-0.1.0.jar /data/gs-spring-boot-0.1.0.jar