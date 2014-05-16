FROM ubuntu:14.04
MAINTAINER James Turnbull <james@lovedthanlost.net>

RUN apt-get -qqy update
RUN apt-get -qqy install git nodejs npm
RUN ln -s /usr/bin/nodejs /usr/bin/node
WORKDIR /opt

# Install reveal.js
RUN git clone https://github.com/hakimel/reveal.js.git presentation
WORKDIR /opt/presentation
RUN npm install -g grunt-cli
RUN npm install
ADD docker.css /opt/presentation/css/theme/docker.css
RUN sed -i s/default.css/docker.css/ index.html

# Install wetty
RUN git clone https://github.com/krishnasrinivas/wetty
WORKDIR /opt/presentation/wetty
RUN npm install

WORKDIR /opt/presentation

