FROM debian:8.0

RUN apt update && apt install -y nasm \
    gcc \
    make \
    gdb \
    vim \
    wget \
    tar \
    sudo \
    build-essential \
    libbz2-dev \
    libdb-dev \
    libreadline-dev \
    libffi-dev \
    libgdbm-dev \
    liblzma-dev \
    libncursesw5-dev \
    libsqlite3-dev \
    libssl-dev \
    zlib1g-dev \
    uuid-dev \
    tk-dev

RUN wget https://www.python.org/ftp/python/3.9.13/Python-3.9.13.tar.xz
RUN tar xJf Python-3.9.13.tar.xz
RUN cd Python-3.9.13 && ./configure && make && sudo make install

WORKDIR /usr/src
