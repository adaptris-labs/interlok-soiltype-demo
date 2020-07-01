FROM adaptris/interlok-base:latest-zulu-alpine

EXPOSE 8080 5555

ARG java_tool_opts
ENV JAVA_TOOL_OPTIONS=$java_tool_opts

COPY . /root/builder

WORKDIR /opt/interlok

RUN cd /root/builder && \
    chmod +x /root/builder/gradlew && \
    rm -rf /opt/interlok/docs && \
    ./gradlew --no-daemon check installDist && \
    chmod +x /docker-entrypoint.sh && \
    rm -rf /root/.gradle && \
    rm -rf /root/builder

ENV JAVA_TOOL_OPTIONS=""
