FROM ubuntu

RUN apt-get update \
    && apt-get install -y \
    make=4.1-9.1ubuntu1 \
    s3cmd=2.0.1-2 \
    mysql-client=5.7.25-0ubuntu0.18.04.2

# install gomplate
COPY --from=hairyhenderson/gomplate:v2.5.0-slim /gomplate /bin/gomplate

RUN apt-get install -y openssl
RUN apt-get install -y ca-certificates
RUN update-ca-certificates

ADD ./src /tmp/src

WORKDIR /tmp/src

CMD [ "/bin/bash", "-c", "./entrypoint.sh"]