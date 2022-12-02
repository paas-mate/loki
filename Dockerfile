FROM shoothzj/base

WORKDIR /opt/loki

ARG TARGETARCH

RUN wget https://github.com/grafana/loki/releases/download/v2.7.0/loki-linux-$TARGETARCH.zip  && \
    unzip loki-linux-$TARGETARCH.zip && \
    mv loki-linux-$TARGETARCH loki && \
    rm -rf loki-linux-$TARGETARCH.zip

ENV LOKI_HOME=/opt/loki

ENTRYPOINT ["/opt/loki/loki"]
CMD ["-config.file=/opt/loki/config/config.yml"]
