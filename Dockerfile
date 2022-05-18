FROM debian:8.0

RUN apt update && apt install -y nasm \
    gcc \
    make \
    gdb \
    vim

WORKDIR /usr/src
