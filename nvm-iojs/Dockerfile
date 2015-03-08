############################################################
# Dockerfile for Sane-stack to run sails.js API application
############################################################

FROM debian:wheezy

MAINTAINER Markus Padourek <markus@artificial.io>
MAINTAINER Kris Williams <kris@kris.net>

ENV NODE_VERSION iojs
ENV HOME /home
ENV DEBIAN_FRONTEND noninteractive

RUN rm /bin/sh && ln -s /bin/bash /bin/sh && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
      # a lot of fat comes from this package... see if we can pare it down
      # c compiler is necessary for native modules
      build-essential \
      gyp \
      libssl-dev \
      adduser \
      ca-certificates \
      git \
      curl \
    && \
    # create "sane" group
    addgroup --gid=1000 sane && \
    # create "sane" user
    adduser --system --uid=1000 --home $HOME --shell /bin/bash sane >> /dev/null 2>&1  && \
    echo "sane ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers && \
    mkdir /server && \
    chown -R sane:sane $HOME && \
    chown -R sane:sane /server && \
    chown -R sane:sane /usr/local && \
    # clean-up packages
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean

USER sane

# install node version manager
RUN git clone https://github.com/creationix/nvm.git $HOME/.nvm && \
    cd ~ && \
    echo 'test -s ~/.nvm/nvm.sh && . $_' >> $HOME/.bashrc && \
    # install node
    source ~/.nvm/nvm.sh && \
    nvm install $NODE_VERSION >> /dev/null 2>&1 && \
    nvm alias default $NODE_VERSION && \
    npm -g i sails@0.11 grunt bower npm-check-updates

# Define mountable directories.
VOLUME ["/server"]

# Define working directory.
WORKDIR /server

# Expose ports.
EXPOSE 1337
