############################################################
# Dockerfile for Sane-stack to run sails.js API application
############################################################

FROM buildpack-deps:jessie

MAINTAINER Markus Padourek <markus@artificial.io>
MAINTAINER Kris Williams <kris@kris.net>

ENV NODE_VERSION iojs
ENV HOME /home
ENV DEBIAN_FRONTEND noninteractive

RUN rm /bin/sh && ln -s /bin/bash /bin/sh && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
      git \
      curl \
    && apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    # create "sane" group
    addgroup --gid=1000 sane && \
    # create "sane" user
    adduser --system --uid=1000 --home $HOME --shell /bin/bash sane >> /dev/null 2>&1  && \
    echo "sane ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers && \
    mkdir /server && \
    chown -R sane:sane $HOME && \
    chown -R sane:sane /server && \
    chown -R sane:sane /usr/local

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
