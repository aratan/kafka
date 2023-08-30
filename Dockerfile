# Utilizamos una imagen base de Ubuntu
FROM ubuntu:20.04

# Actualizamos el sistema y instalamos las herramientas necesarias
RUN apt-get update && apt-get install -y openjdk-11-jre-headless wget

# Directorio de trabajo en el contenedor
WORKDIR /app

# Descargamos Kafka desde Apache y lo descomprimimos
RUN wget https://downloads.apache.org/kafka/3.5.1/kafka_2.12-3.5.1.tgz  && \
    tar -xzf  kafka_2.12-3.5.1.tgz  && \
    mv  kafka_2.12-3.5.1 kafka && \
    rm  kafka_2.12-3.5.1.tgz 

# Definimos la variable de entorno para Kafka
ENV KAFKA_HOME /app/kafka
ENV PATH $PATH:$KAFKA_HOME/bin

# Puerto de Kafka que se expondrá en el contenedor
EXPOSE 9092

# Comando para iniciar Kafka
CMD ["kafka-server-start.sh", "/app/kafka/config/server.properties"]
