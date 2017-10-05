FROM alpine:latest

RUN apk --update --no-cache add \
      python \
      py-pip \
      openssl \
    && pip install --upgrade --no-cache-dir awscli \
    && mkdir -p /opt/devtools/work \
    && apk del py-pip \
    && rm -rf ~/.cache /tmp/* \
    && find /usr/local \
          \( -type d -a -name test -o -name tests \) -exec echo rm -rf '{}' + \
          -o \( -type f -a -name '*.pyc' -o -name '*.pyo' \) -exec echo rm -f '{}' +

WORKDIR /opt/devtools/work

CMD ["/bin/sh"]