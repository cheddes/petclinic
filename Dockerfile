FROM java:openjdk-7-jdk

USER root

RUN wget http://ftp.fau.de/apache/maven/maven-3/3.3.1/binaries/apache-maven-3.3.1-bin.tar.gz
RUN tar -zxvf apache-maven-3.3.1-bin.tar.gz
RUN rm apache-maven-3.3.1-bin.tar.gz
RUN mv apache-maven-3.3.1 /usr/lib/mvn
RUN ln -s /usr/lib/mvn/bin/mvn /usr/bin/mvn

ENV REFRESHED_AT=2015-12-27-06

ENV M2_HOME /usr/lib/mvn
ENV M2 $M2_HOME/bin
ENV PATH $PATH:$M2
ENV JAVA_HOME /usr/lib/jvm/java-1.7.0-openjdk-amd64


RUN mkdir /app
#ENV JAVA_APP_DIR /app
COPY spring-petclinic-master /app/spring-petclinic-master

# Add run script as /app/run-java.sh and make it executable
COPY run-java.sh /app/
RUN chmod +x /app/run-java.sh

#CMD ["ls $JAVA_APP_DIR"]
EXPOSE 9966

VOLUME /root/.m2

#CMD cd /app/spring-petclinic-master
#CMD cd /app/spring-petclinic-master && mvn tomcat7:run
CMD cd /app && ./run-java.sh
