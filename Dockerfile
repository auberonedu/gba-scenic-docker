FROM devkitpro/devkitarm:20251231

ARG BUTANO_VERSION=21.0.0
ARG BUTANO_TGZ_SHA256="a65ebb50e080dfee92753e1e036d52bc6b792234302cb8d40287b9f91b003c20"

ENV BUTANO_HOME=/opt/butano/butano

RUN mkdir -p /opt/butano \
 && curl -fsSL "https://github.com/GValiente/butano/archive/refs/tags/${BUTANO_VERSION}.tar.gz" -o /tmp/butano.tar.gz \
 && echo "${BUTANO_TGZ_SHA256}  /tmp/butano.tar.gz" | sha256sum -c - \
 && tar -xzf /tmp/butano.tar.gz -C /opt/butano --strip-components=1 \
 && rm -f /tmp/butano.tar.gz \
 && test -d "$BUTANO_HOME"