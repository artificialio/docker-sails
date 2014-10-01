############################################################
# Dockerfile to that builds on top of nginx to run
# a sails app with PM2
############################################################


FROM dockerfile/nodejs

MAINTAINER Markus Padourek <markus@artificial.io>

RUN npm install -g pm2 sails grunt bower
RUN mkdir /server

#installs nginx to /usr/sbin/nginx
#conf file is at /etc/nginx/nginx.conf

# Define mountable directories.
VOLUME ["/server/"]

# Define working directory.
WORKDIR /server

# Define default command.
#CMD ["pm2"]

# Expose ports.
EXPOSE 1337
EXPOSE 3000