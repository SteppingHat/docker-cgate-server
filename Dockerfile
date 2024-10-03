ARG CGATE_DOWNLOAD_URL=https://download.schneider-electric.com/files?p_File_Name=cgate-2.11.8_3282.zip

FROM ubuntu:latest AS base

WORKDIR /app

RUN apt-get update && \
	apt-get install -y curl unzip && \
	rm -rf /var/lib/apt/lists/*

ARG CGATE_DOWNLOAD_URL

RUN curl -L ${CGATE_DOWNLOAD_URL} -o cgate.zip && \
    unzip cgate.zip && \
	rm cgate.zip

FROM openjdk:12-alpine AS app

WORKDIR /cgate

COPY --from=base /app/cgate /cgate

RUN ln -s /cgate/config /config && \
	ln -s /cgate/tag /tag && \
	ln -s /cgate/logs /logs

EXPOSE 8080
EXPOSE 20023
EXPOSE 20024
EXPOSE 20025
EXPOSE 20026
EXPOSE 20123

VOLUME /config
VOLUME /tag
VOLUME /logs

CMD ["java", "-jar", "cgate.jar"]
