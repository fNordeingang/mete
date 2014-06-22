FROM ubuntu:14.04
MAINTAINER vileda (https://fnordeingang.de)

RUN DEBIAN_FRONTEND=noninteractive apt-get install -qq -y openssh-server ruby1.9.3 rubygems-integration \
                    bundler imagemagick git-core zlib1g zlib1g-dev build-essential sqlite3 libsqlite3-dev openssl \
                    libssl-dev libyaml-dev libreadline-dev libxml2-dev libxslt1-dev nodejs \
                    nginx-full

ADD docker /docker

RUN cd /mete && bundle

# How the instance is launched.
ENTRYPOINT ["/mete/docker/init"]
CMD ["app:start"]
EXPOSE 22 80 3000
