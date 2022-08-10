FROM ttbb/base

WORKDIR /opt/sh/loki

ARG TARGETARCH

RUN wget https://github.com/grafana/loki/releases/download/v2.6.1/loki-linux-$TARGETARCH.zip  && \
    unzip loki-linux-$TARGETARCH.zip && \
    mv loki-linux-$TARGETARCH loki && \
    rm -rf loki-linux-$TARGETARCH.zip

ENV LOKI_HOME=/opt/sh/loki

ENTRYPOINT ["/opt/sh/loki/loki"]
CMD ["-config.file=/opt/sh/loki/config/config.yml"]
