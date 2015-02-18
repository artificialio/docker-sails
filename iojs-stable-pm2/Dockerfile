############################################################
# Dockerfile for Sane-stack to run sails.js API application
############################################################

FROM iojs:slim

MAINTAINER Markus Padourek <markus@artificial.io>

RUN apt-get update && \
    apt-get install -y git

RUN npm install -g sails grunt bower pm2 npm-check-updates
RUN mkdir /server

# Define mountable directories.
VOLUME ["/server"]

# Define working directory.
WORKDIR /server

# Expose ports.
EXPOSE 1337
