############################################################
# Dockerfile for Sane-stack to run sails.js API application
############################################################

FROM node:0.11-slim

MAINTAINER Markus Padourek <markus@artificial.io>

RUN npm install -g sails@v0.11.0-rc4 grunt bower pm2 npm-check-updates
RUN mkdir /server

# Define mountable directories.
VOLUME ["/server"]

# Define working directory.
WORKDIR /server

# Expose ports.
EXPOSE 1337