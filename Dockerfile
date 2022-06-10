FROM debian:bullseye-slim
RUN dpkg-reconfigure debconf -f noninteractive -p critical
RUN echo 'root:root' | chpasswd

RUN apt-get update && apt-get install --no-install-recommends -y \
    build-essential \
    ca-certificates \
    chrpath \
    clang \
    cpio \
    diffstat \
    file \
    gawk \
    git \
    libncurses5-dev \
    locales \
    lz4 \
    python3-cairo \
    python3-distutils \
    ssh \
    wget \
    zstd

RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen \
    && locale-gen
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN groupadd -g 1000 dev \
    && useradd -m -u 1000 -g dev dev

RUN mkdir -p /ws/pi \
    && chown -R 1000:1000 /ws

WORKDIR /ws
USER dev
