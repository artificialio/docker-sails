############################################################
# Dockerfile to that builds on top of nginx to run
# a sails app with PM2
############################################################


FROM node:0.10.32-slim

MAINTAINER Markus Padourek <markus@artificial.io>

RUN npm install -g pm2@0.11.1 sails@0.10.5 grunt bower
RUN mkdir /server

#installs nginx to /usr/sbin/nginx
#conf file is at /etc/nginx/nginx.conf

# Define mountable directories.
VOLUME ["/server"]

# Define working directory.
WORKDIR /server

# Define default command.
#CMD ["pm2"]

# Expose ports.
EXPOSE 1337
EXPOSE 3000
