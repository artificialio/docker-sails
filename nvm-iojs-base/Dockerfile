############################################################
# Dockerfile for Node Version Manager (nvm) - base image
# artificial:nvm-iojs-base
############################################################

FROM debian:latest

MAINTAINER Markus Padourek <markus@artificial.io>
MAINTAINER Kris Williams <kris@kris.net>

ENV NODE_VERSION iojs
ENV HOME /home
ENV NVM_DIR $HOME/.nvm
ENV DEBIAN_FRONTEND noninteractive

COPY sources.list /etc/apt/sources.list

RUN rm /bin/sh && ln -s /bin/bash /bin/sh && \
    apt-get update && \
    # backports git for newer git, needed for nvm install
    apt-get -y --no-install-recommends -t wheezy-backports install git && \
    apt-get install -y --no-install-recommends \
      # uncomment if you need to use sudo
      # sudo
      # a lot of fat comes from this package... see if we can pare it down
      # c compiler is necessary for native modules
      build-essential \
      gyp \
      libssl-dev \
      adduser \
      ca-certificates \
      curl \
    && \
    # create "sane" group
    addgroup --gid=1000 sane && \
    # create "sane" user
    adduser --system --uid=1000 --home $HOME --shell /bin/bash sane >> /dev/null 2>&1  && \
    # install sudo to use it
    echo "sane ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers && \
    chown -R sane:sane $HOME && \
    mkdir -p /server && \
    chown -R sane:sane /server && \
    chown -R sane:sane /usr/local && \
    # clean-up packages
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean

USER sane

# install node version manager
RUN touch $HOME/.bashrc && \
    echo $NODE_VERSION > $HOME/.nvmrc && \
    NVM_VERSION="$(curl -s -L http://latest.nvm.sh -o /dev/null -D - | grep -Ei '^Location: .*tag/v[0-9.]+' | grep -oEi 'v[0-9.]+')" && \
    curl https://raw.githubusercontent.com/creationix/nvm/$NVM_VERSION/install.sh | sh && \
    # install node
    source $NVM_DIR/nvm.sh && \
    nvm install $NODE_VERSION >> /dev/null 2>&1 && \
    nvm alias default $NODE_VERSION

# default start command
CMD \
    # start nvm in non-interactive shell
    source $NVM_DIR/nvm.sh && \
    # install any node version present in /server/.nvmrc
    nvm install >> /dev/null 2>&1 && \
    # print version information and exit
    npm version
