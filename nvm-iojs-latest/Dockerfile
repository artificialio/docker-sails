############################################################
# Dockerfile for Sane-stack to run sails.js API application
############################################################

FROM artificial:nvm-iojs-base

MAINTAINER Markus Padourek <markus@artificial.io>
MAINTAINER Kris Williams <kris@kris.net>

USER sane

# install sails
RUN npm -g i sails@0.11 grunt bower pm2

# Define mountable directories.
VOLUME ["/server"]

# Define working directory.
WORKDIR /server

# Expose ports.
EXPOSE 1337

CMD [ "npm", "start" ]
