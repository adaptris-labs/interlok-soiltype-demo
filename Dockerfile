FROM adaptris/interlok:snapshot-alpine

EXPOSE 8080 5555

ARG java_tool_opts
ENV JAVA_TOOL_OPTIONS=$java_tool_opts

COPY docker-entrypoint-memorydb.sh /

COPY builder /root/builder

WORKDIR /root/builder
RUN \
    chmod +x /root/builder/gradlew && \
    rm -rf /opt/interlok/docs && \
    ./gradlew --debug --no-daemon installDist && \
    chmod +x /docker-entrypoint.sh && \
    chmod +x /docker-entrypoint-memorydb.sh

ENV JAVA_TOOL_OPTIONS=""

WORKDIR /opt/interlok

ENTRYPOINT ["/docker-entrypoint-memorydb.sh"]
