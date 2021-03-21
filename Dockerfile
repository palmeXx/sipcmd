### Build sipcmd with stretch
FROM debian:stretch

RUN apt-get update && apt-get upgrade -y
RUN apt-get install build-essential libopal-dev libpt-dev -y

COPY . /build
WORKDIR /build

RUN make
RUN chmod +x sipcmd && mv sipcmd /usr/bin/ && rm -rf /build

USER 10001:10001
ENTRYPOINT [ "/usr/bin/sipcmd" ]
