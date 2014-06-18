FROM ubuntu:14.04
MAINTAINER vileda (https://fnordeingang.de)

RUN DEBIAN_FRONTEND=noninteractive apt-get install -qq -y openssh-server ruby1.9.3 rubygems-integration bundler git-core

RUN git clone https://github.com/fNordeingang/mete.git /mete

# How the instance is launched.
ENTRYPOINT ["/mete/docker/init"]
CMD ["app:start"]
EXPOSE 22 80
