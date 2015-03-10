##io.js

The goal of this image is to be a minimally sized (~306MB) docker image that still allows to build native addons such as node-sass or bcrypt. Furthermore it is installing nvm which is then used to install the latest iojs without the need for sudo.

This image is the basis for all [SANE](http://sanestack.com/) docker images.

Right now the only tag supported is `latest`, which automatically installs the latest nvm and io.js. Tags can easily be added if needed. Just create an issue at: [github.com/artificialio/docker-sails/issues](https://github.com/artificialio/docker-sails/issues)
