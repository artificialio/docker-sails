############################################################
# Dockerfile for Sane-stack to run sails.js API application
############################################################

FROM node:slim

MAINTAINER Markus Padourek <markus@artificial.io>

RUN npm install -g sails grunt bower npm-check-updates
RUN mkdir /server

# Define mountable directories.
VOLUME ["/server"]

# Define working directory.
WORKDIR /server

# Expose ports.
EXPOSE 1337
