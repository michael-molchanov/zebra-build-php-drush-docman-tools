FROM michaeltigr/zebra-build-php-drush-docman:latest

LABEL maintainer "Michael Molchanov <mmolchanov@adyax.com>"

USER root

# Install nodejs and grunt.
RUN apk add --update --no-cache --repository http://nl.alpinelinux.org/alpine/edge/main 'nodejs>8.9' 'nodejs-npm>8.9' 'nodejs-dev>8.9' 'yarn>1.5' \
  && rm -rf /var/cache/apk/* \
  && npm install -g gulp-cli grunt-cli \
  && grunt --version \
  && gulp --version \
  && yarn versions

# Install compass.
RUN gem install --no-ri --no-rdoc compass
