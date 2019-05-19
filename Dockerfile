FROM resin/rpi-raspbian:latest
ENTRYPOINT []

RUN apt-get update && \
  apt-get -qy install curl \
  build-essential python \
  ca-certificates
WORKDIR /root/
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
RUN nvm install stable

CMD ["node"]
