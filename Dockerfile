FROM debian:bullseye

ARG S6_OVERLAY_VERSION=v3.1.2.1

RUN DEBIAN_FRONTEND='noninteractive' \
    apt-get update \
    && apt-get install -y \
       apt-transport-https \
       apt-utils \
       ca-certificates \
       net-tools \
       bash \
       curl \
       nano \
       xz-utils \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN curl https://github.com/just-containers/s6-overlay/releases/download/${S6_OVERLAY_VERSION}/s6-overlay-noarch.tar.xz -SLo- | tar -C / -Jxpf - && \
    curl https://github.com/just-containers/s6-overlay/releases/download/${S6_OVERLAY_VERSION}/s6-overlay-aarch64.tar.xz -SLo- | tar -C / -Jxpf -


COPY rootfs/ /