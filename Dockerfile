FROM ubuntu:18.04

RUN apt-get update && apt-get install -y -qq wget unzip ant openjdk-8-jdk git && apt-get clean

RUN wget https://storage.googleapis.com/appengine-sdks/featured/appengine-java-sdk-1.9.82.zip && unzip appengine-java-sdk-1.9.82.zip && rm appengine-java-sdk-1.9.82.zip

WORKDIR appengine-java-sdk-1.9.82/demos/

RUN git clone https://github.com/NeuraLegion/firing-range

WORKDIR firing-range/

EXPOSE 8080 5050

CMD ["ant","-Daddress=0.0.0.0","runserver"]
