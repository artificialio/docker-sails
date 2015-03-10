############################################################
# Dockerfile for Sane-stack to run sails.js API application
############################################################

FROM artificial/iojs-nvm:latest

MAINTAINER Markus Padourek <markus@artificial.io>
MAINTAINER Kris Williams <kris@kris.net>

USER sane

# install sails
RUN source $NVM_DIR/nvm.sh && \
    npm -g i sails@0.11 grunt bower pm2 && \
    npm cache clean

# Define mountable directories.
VOLUME ["/server"]

# Define working directory.
WORKDIR /server

# Expose ports.
EXPOSE 1337

# default start command
CMD \
    # start nvm in non-interactive shell
    source $NVM_DIR/nvm.sh && \
    # install any node version present in /server/.nvmrc
    nvm install >> /dev/null 2>&1 && \
    # run start as indicated in package.json
    npm start
