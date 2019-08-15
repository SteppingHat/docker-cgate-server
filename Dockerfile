FROM openjdk:12-alpine

ARG APP_PATH=/cgate

COPY files/cgate ${APP_PATH}

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

WORKDIR $APP_PATH
CMD ["java", "-jar", "cgate.jar"]
