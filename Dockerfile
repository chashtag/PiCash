FROM debian:bullseye

ARG S6_OVERLAY_VERSION=v3.1.2.1

RUN DEBIAN_FRONTEND='noninteractive' \
    apt-get update \
    && apt-get install -y apt-utils \
    && apt-get install -y \
       apt-transport-https \
       bash \
       ca-certificates \
       curl \
       iproute2 \
       nano \
       net-tools \
       procps \
       qemu-user \
       wget \
       xz-utils \
       zip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN curl https://github.com/just-containers/s6-overlay/releases/download/${S6_OVERLAY_VERSION}/s6-overlay-noarch.tar.xz -SLo- | tar -C / -Jxpf - && \
    curl https://github.com/just-containers/s6-overlay/releases/download/${S6_OVERLAY_VERSION}/s6-overlay-aarch64.tar.xz -SLo- | tar -C / -Jxpf -


# HONEYGAIN
RUN mkdir -p /opt/honeygain && \ 
    curl -L https://github.com/chashtag/PiCash/releases/download/bin/honeygain.tar.gz | tar -C /opt/honeygain -zxf - && \
    mkdir -p /etc/qemu-binfmt/x86_64/lib64/ && \
    curl -L https://github.com/chashtag/PiCash/releases/download/bin/ld64.tar.gz | tar -C /etc/qemu-binfmt/x86_64/lib64/ -zxf -


# Pawns.app (IPRoyal)
RUN curl -L https://download.iproyal.com/pawns-cli/latest/linux_aarch64/pawns-cli > /usr/bin/pawns-cli && \
    chmod +x /usr/bin/pawns-cli


# Packetstream
RUN mkdir -p /opt/packetstream && \
    curl -L https://github.com/chashtag/PiCash/releases/download/bin/packetstream.tar.gz | tar -C /opt/packetstream/ -zxf -


# Peer2Profit
RUN curl -L https://github.com/chashtag/PiCash/releases/download/bin/p2pclient_0.63_arm64.deb > /tmp/p2pclient_0.63_arm64.deb && \
    dpkg -i /tmp/p2pclient_0.63_arm64.deb && \
    rm -rf /tmp/p2pclient_0.63_arm64.deb


# Traffmonetizer
RUN mkdir -p /opt/traffmonetizer && \
    curl -L https://github.com/chashtag/PiCash/releases/download/bin/traffmonetizer.tar.gz | tar -C /opt/traffmonetizer -zxf -


# BitPing
RUN wget https://downloads.bitping.com/node/linux.zip && unzip linux.zip -d /opt/bitping && rm -rf linux.zip

COPY rootfs/ /

RUN useradd -ms /bin/bash picash

ENTRYPOINT [ "/init" ]