FROM ghcr.io/linuxserver/baseimage-ubuntu:bionic

# environment settings
ENV HOME="/config"

RUN \
    echo "**** install node repo ****" && \
    apt-get update && \
    apt-get install -y \
        gnupg && \
    curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - && \
    echo 'deb https://deb.nodesource.com/node_14.x bionic main' \
        > /etc/apt/sources.list.d/nodesource.list && \
    curl -s https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo 'deb https://dl.yarnpkg.com/debian/ stable main' \
        > /etc/apt/sources.list.d/yarn.list && \
    echo "**** install build dependencies ****" && \
    apt-get install -y \
        build-essential \
        libx11-dev \
        libxkbfile-dev \
        libsecret-1-dev \
        pkg-config && \
    echo "**** install runtime dependencies ****" && \
    apt-get install -y \
        git \
        jq \
        nano \
        net-tools \
        nodejs \
        sudo \
        yarn && \
    echo "**** install code-server-live ****" && \
    mkdir -p ~/.local/lib ~/.local/bin && \
    curl -fL https://github.com/coderpair/vscode-live/releases/download/v1.1.0/vscode-live-1.1.0-linux-amd64.tar.gz | tar -C ~/.local/lib -xz && \
    mv ~/.local/lib/code-server-3.8.0-linux-amd64 ~/.local/lib/code-server-3.8.0 && \
    ln -s ~/.local/lib/code-server-3.8.0/bin/code-server /usr/local/bin/code-server && \
    echo "**** clean up ****" && \
    apt-get purge --auto-remove -y \
        build-essential \
        libx11-dev \
        libxkbfile-dev \
        libsecret-1-dev \
        pkg-config && \
    apt-get clean && \
    rm -rf \
        /tmp/* \
        /var/lib/apt/lists/* \
        /var/tmp/*

# add local files
COPY /root /

# ports and volumes
EXPOSE 8443