FROM openjdk:11

COPY app.jar /home

WORKDIR /home/ubuntu/javadocker

RUN cd /home/ubuntu/javadocker

ENTRYPOINT java -jar /home/ubuntu/javadocker/app.jar
