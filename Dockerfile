FROM openjdk:11

WORKDIR /home

RUN cd /home

COPY Quatro-1.1-SNAPSHOT-jar-with-dependencies.jar /home

ENTRYPOINT java -jar /home/Quatro-1.1-SNAPSHOT-jar-with-dependencies.jar
